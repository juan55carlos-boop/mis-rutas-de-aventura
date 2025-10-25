# server/ - Backend API

## Overview
This directory contains the backend API server for "Mis Rutas de Aventura" built with Express.js.

## Structure
- **index.js** - Main server entry point
- **routes/** - API route definitions
  - users.js - User management endpoints
  - routes.js - Route CRUD operations
  - auth.js - Authentication endpoints
  - integrations.js - Third-party integrations
- **controllers/** - Business logic controllers
- **models/** - Database models (if using ORM)
- **middleware/** - Custom middleware (auth, validation, etc.)
- **services/** - External service integrations
- **utils/** - Utility functions
- **config/** - Configuration files

## Technologies
- **Framework**: Express.js
- **Database**: PostgreSQL with PostGIS extension
- **Authentication**: JWT (JSON Web Tokens)
- **ORM**: Sequelize or raw SQL queries
- **Validation**: Joi or express-validator

## API Endpoints

### Authentication
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `POST /api/auth/logout` - User logout
- `GET /api/auth/refresh` - Refresh token

### Users
- `GET /api/users/profile` - Get user profile
- `PUT /api/users/profile` - Update user profile
- `GET /api/users/:id/routes` - Get user's routes

### Routes
- `GET /api/routes` - List all public routes
- `POST /api/routes` - Create new route
- `GET /api/routes/:id` - Get route details
- `PUT /api/routes/:id` - Update route
- `DELETE /api/routes/:id` - Delete route
- `POST /api/routes/:id/favorite` - Add to favorites
- `POST /api/routes/:id/review` - Add review

### Integrations
- `GET /api/integrations/weather` - Weather data
- `GET /api/integrations/geocode` - Geocoding
- `GET /api/integrations/booking` - Booking affiliate links

## Environment Variables
See `.env.example` in the root directory for required environment variables.

## Getting Started
```bash
# Install dependencies
npm install

# Run development server
npm run dev

# Run production server
npm start

# Run database migrations
npm run migrate
```

## Database Setup
```bash
# Initialize database with schema
psql -U username -d rutas_aventura -f ../schema.sql
```

## Security
- JWT authentication
- Input validation and sanitization
- Rate limiting
- CORS configuration
- SQL injection prevention
