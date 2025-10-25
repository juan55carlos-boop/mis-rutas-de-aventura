# Mis Rutas de Aventura – Juan & Mary

Desarrollado y creado por Juan Carlos Muñoz Sáez

Proyecto: plataforma viva y autónoma para rutas de aventura por España (moto, autocaravana, coche). Multilingüe y optimizada para móvil y escritorio. Monetización mediante afiliados y publicidad contextual.

Contenido del repo:
- src/: front-end PWA inicial (mapa con Leaflet/MapLibre)
- server/: API Express (endpoints para rutas, usuarios, integraciones)
- i18n/: traducciones en 5 idiomas
- schema.sql: esquema inicial de base de datos (Postgres + PostGIS)
- .env.example: variables de entorno

Requisitos mínimos:
- Node 18+
- PostgreSQL con PostGIS
- Redis (opcional para caché/colas)
- Claves API: MAP_PROVIDER_KEY, BOOKING_AFFILIATE_KEY, COMET_API_KEY (o motor IA equivalente)
- Configurar DNS/HTTPS para producción

Comandos básicos:
- Front: abrir `src/index.html` o lanzar con servidor estático
- Backend (desarrollo): `npm install` y `npm run dev` (ver package.json)
- DB: ejecutar `schema.sql` en tu base de datos PostgreSQL con PostGIS

Siguiente paso recomendado:
1. Obtener claves de APIs necesarias (map provider, afiliados).
2. Configurar variables en `.env`.
3. Desplegar back-end en cloud (Heroku/Render/Fly/Vercel with functions) y front en CDN.
4. Configurar pipeline de IA ("Comet") para actualizaciones programadas.