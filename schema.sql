-- Mis Rutas de Aventura - Database Schema
-- PostgreSQL with PostGIS extension

-- Enable PostGIS extension
CREATE EXTENSION IF NOT EXISTS postgis;

-- Users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(100),
    profile_picture VARCHAR(255),
    bio TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);

-- Routes table
CREATE TABLE routes (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    difficulty VARCHAR(20) CHECK (difficulty IN ('easy', 'moderate', 'hard', 'expert')),
    distance DECIMAL(10, 2), -- in kilometers
    elevation_gain DECIMAL(10, 2), -- in meters
    estimated_time INTEGER, -- in minutes
    route_geometry GEOMETRY(LineString, 4326),
    start_point GEOMETRY(Point, 4326),
    end_point GEOMETRY(Point, 4326),
    is_public BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Route points of interest
CREATE TABLE route_pois (
    id SERIAL PRIMARY KEY,
    route_id INTEGER REFERENCES routes(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    poi_type VARCHAR(50), -- viewpoint, rest_area, water_source, camping, etc.
    location GEOMETRY(Point, 4326),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Route photos
CREATE TABLE route_photos (
    id SERIAL PRIMARY KEY,
    route_id INTEGER REFERENCES routes(id) ON DELETE CASCADE,
    user_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
    photo_url VARCHAR(255) NOT NULL,
    caption TEXT,
    location GEOMETRY(Point, 4326),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Route ratings and reviews
CREATE TABLE route_reviews (
    id SERIAL PRIMARY KEY,
    route_id INTEGER REFERENCES routes(id) ON DELETE CASCADE,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5),
    review_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(route_id, user_id)
);

-- User favorite routes
CREATE TABLE user_favorites (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    route_id INTEGER REFERENCES routes(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, route_id)
);

-- Route activities/logs
CREATE TABLE route_activities (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    route_id INTEGER REFERENCES routes(id) ON DELETE SET NULL,
    activity_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    duration INTEGER, -- in minutes
    distance DECIMAL(10, 2), -- actual distance covered
    notes TEXT,
    gps_track GEOMETRY(LineString, 4326)
);

-- Create indexes for better performance
CREATE INDEX idx_routes_user_id ON routes(user_id);
CREATE INDEX idx_routes_geometry ON routes USING GIST(route_geometry);
CREATE INDEX idx_routes_start_point ON routes USING GIST(start_point);
CREATE INDEX idx_routes_end_point ON routes USING GIST(end_point);
CREATE INDEX idx_route_pois_location ON route_pois USING GIST(location);
CREATE INDEX idx_route_photos_location ON route_photos USING GIST(location);
CREATE INDEX idx_route_activities_user_id ON route_activities(user_id);
CREATE INDEX idx_route_activities_route_id ON route_activities(route_id);

-- Insert sample data (optional)
INSERT INTO users (username, email, password_hash, full_name) VALUES
('admin', 'admin@example.com', 'hashed_password_here', 'Administrator');

COMMENT ON TABLE users IS 'Application users';
COMMENT ON TABLE routes IS 'Adventure routes created by users';
COMMENT ON TABLE route_pois IS 'Points of interest along routes';
COMMENT ON TABLE route_photos IS 'Photos uploaded for routes';
COMMENT ON TABLE route_reviews IS 'User reviews and ratings for routes';
COMMENT ON TABLE user_favorites IS 'User favorite routes';
COMMENT ON TABLE route_activities IS 'User activity logs for completed routes';
