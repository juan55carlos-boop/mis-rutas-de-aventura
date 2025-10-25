# src/ - Frontend PWA

## Overview
This directory contains the front-end Progressive Web Application (PWA) for "Mis Rutas de Aventura".

## Structure
- **index.html** - Main HTML entry point
- **main.js** - Application entry point
- **components/** - Reusable UI components
- **views/** - Page views/routes
- **services/** - API communication services
- **utils/** - Utility functions
- **styles/** - CSS/SCSS styles
- **assets/** - Static assets (images, icons, fonts)

## Technologies
- **Map Library**: Leaflet or MapLibre GL JS
- **Framework**: Vanilla JS or Vue.js/React (to be decided)
- **Build Tool**: Vite
- **PWA**: Service Worker, Manifest

## Features
- Interactive map with route visualization
- Route creation and editing
- User profile management
- Offline support (PWA)
- Multi-language support (i18n)
- Responsive design

## Getting Started
```bash
# Install dependencies
npm install

# Run development server
npm run dev

# Build for production
npm run build
```

## Environment Variables
See `.env.example` in the root directory for required environment variables.
