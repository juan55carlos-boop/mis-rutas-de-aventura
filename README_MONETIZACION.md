# 💰 Guía de Monetización - Mis Rutas de Aventura

Esta guía te ayudará a configurar y activar los sistemas de monetización incluidos en el proyecto **Mis Rutas de Aventura**. Sigue estos pasos para obtener tus IDs de afiliado y comenzar a generar ingresos con tu sitio web de viajes.

## 🎯 Sistemas de Monetización Incluidos

### 1. Widget de Donaciones PayPal ✅
- **Archivo**: `src/components/donation-widget.html`
- **Estado**: Configurado con email `juan55carlos@gmail.com`
- **Acción requerida**: Ninguna, ya está activo

### 2. Enlaces de Afiliados 🔧
- **Archivo de configuración**: `src/config/affiliates.js`
- **Plataformas incluidas**: Booking.com, GetYourGuide, Civitatis, Amazon
- **Acción requerida**: Obtener y configurar IDs de afiliado

---

## 📋 Cómo Obtener los IDs de Afiliado

### 🏨 1. Booking.com Affiliate Program

**Requisitos**:
- Sitio web con contenido de viajes
- Tráfico mínimo recomendado: 1,000+ visitantes/mes

**Pasos**:
1. Visita [Booking.com Partners](https://partner.booking.com/)
2. Haz clic en "Join Now" (Únete Ahora)
3. Completa el formulario de registro:
   - Información personal y de contacto
   - Detalles de tu sitio web
   - Método de pago preferido
4. Espera la aprobación (1-3 días hábiles)
5. Una vez aprobado, obtendrás:
   - **AID (Affiliate ID)**: Tu identificador único
   - **Label**: Etiqueta personalizada opcional

**Configuración en el código**:
```javascript
booking: {
  aid: 'TU_BOOKING_AID_AQUI',  // Reemplazar
  label: 'TU_ETIQUETA_AQUI',    // Reemplazar
  enabled: true  // Cambiar a true
}
```

**Comisión**: 25-40% del valor de la reserva

---

### 🎭 2. GetYourGuide Partner Program

**Requisitos**:
- Sitio web con contenido de viajes/turismo
- Audiencia interesada en actividades y tours

**Pasos**:
1. Ve a [GetYourGuide Partners](https://partner.getyourguide.com/)
2. Selecciona "Become an Affiliate Partner"
3. Completa la aplicación:
   - Información del sitio web
   - Estadísticas de tráfico
   - Estrategia de marketing
4. Revisión de la aplicación (2-5 días hábiles)
5. Obtendrás tu **Partner ID** una vez aprobado

**Configuración en el código**:
```javascript
getYourGuide: {
  partnerId: 'TU_GETYOURGUIDE_PARTNER_ID',
  enabled: true  // Cambiar a true
}
```

**Comisión**: 6-8% del valor de la actividad

---

### 🇪🇸 3. Civitatis Programa de Afiliados

**Requisitos**:
- Sitio web en español con contenido de turismo
- Audiencia hispanohablante

**Pasos**:
1. Accede a [Civitatis Afiliados](https://www.civitatis.com/es/afiliados/)
2. Haz clic en "Solicitar Alta" o "Únete"
3. Completa el formulario:
   - Datos personales y fiscales
   - Información del sitio web
   - Método de promoción
4. Espera la aprobación (1-3 días)
5. Recibirás tu **Affiliate ID**

**Configuración en el código**:
```javascript
civitatis: {
  affiliateId: 'TU_CIVITATIS_AFFILIATE_ID',
  enabled: true  // Cambiar a true
}
```

**Comisión**: 5-7% del valor de la actividad

---

### 📦 4. Amazon Associates (Productos de Viaje)

**Requisitos**:
- Sitio web con contenido original
- Tráfico desde el país objetivo (España recomendado)
- Cumplir con las políticas de Amazon

**Pasos**:
1. Ve a [Amazon Associates](https://afiliados.amazon.es/)
2. Haz clic en "Únete ahora de forma gratuita"
3. Inicia sesión con tu cuenta de Amazon o crea una nueva
4. Completa tu perfil:
   - Información personal y fiscal
   - Detalles del sitio web
   - Métodos de promoción
5. Añade tu sitio web para revisión
6. Obtendrás tu **Associate Tag** (ej: misrutas-21)

**Configuración en el código**:
```javascript
amazon: {
  tag: 'TU_AMAZON_ASSOCIATE_TAG',  // ej: misrutas-21
  enabled: true  // Cambiar a true
}
```

**Comisión**: 1-10% según la categoría del producto

---

## ⚡ Activación Rápida

Una vez que obtengas los IDs:

1. **Edita el archivo** `src/config/affiliates.js`
2. **Reemplaza** los valores `'YOUR_XXXXX_ID'` con tus IDs reales
3. **Cambia** `enabled: false` a `enabled: true` para cada plataforma
4. **Guarda** los cambios
5. **¡Tu sistema de monetización estará activo!**

### Ejemplo de configuración completada:
```javascript
const affiliatesConfig = {
  booking: {
    aid: '1234567',
    label: 'misrutas',
    baseUrl: 'https://www.booking.com/searchresults.html',
    enabled: true  // ✅ ACTIVO
  },
  getYourGuide: {
    partnerId: 'ABCDEF123',
    baseUrl: 'https://www.getyourguide.com',
    enabled: true  // ✅ ACTIVO
  }
  // ... resto de configuración
};
```

---

## 🔍 Verificación y Pruebas

### Cómo verificar que todo funciona:

1. **Abre** `src/index.html` en tu navegador
2. **Inspecciona** la consola del navegador (F12)
3. **Busca** los mensajes:
   - `"Sistema de monetización cargado..."`
   - `"Para más información, consulta README_MONETIZACION.md"`
4. **Haz clic** en los botones de afiliados para probar los enlaces
5. **Verifica** que las URLs incluyen tus IDs de afiliado

---

## 📊 Seguimiento y Optimización

### Herramientas recomendadas:

1. **Google Analytics**: Para rastrear clics en enlaces de afiliados
2. **Dashboards nativos**: Cada plataforma tiene su panel de control
3. **UTM Parameters**: Para identificar el origen del tráfico

### Mejores prácticas:

- ✅ **Transparencia**: Menciona siempre que usas enlaces de afiliados
- ✅ **Contenido de calidad**: Proporciona valor real a tus usuarios
- ✅ **Relevancia**: Solo promociona productos/servicios relacionados
- ✅ **Testing**: Prueba diferentes ubicaciones y formatos
- ✅ **Seguimiento**: Monitorea rendimiento y optimiza regularmente

---

## ❓ FAQ - Preguntas Frecuentes

### ¿Cuánto puedo ganar?
Depende del tráfico y la conversión. Sites de viajes pueden generar desde €100-€5,000+ mensuales.

### ¿Es legal usar enlaces de afiliados?
Sí, pero debes declarar que recibes comisiones. Incluye un disclaimer.

### ¿Qué pasa si mi aplicación es rechazada?
Mejora tu contenido, aumenta el tráfico y vuelve a aplicar en unos meses.

### ¿Puedo usar múltiples programas simultáneamente?
Sí, es recomendable diversificar las fuentes de ingresos.

---

## 📞 Soporte

Si necesitas ayuda con la configuración:

- 📧 **Email**: juan55carlos@gmail.com
- 🐛 **Issues**: Abre un issue en este repositorio
- 📚 **Documentación**: Lee los archivos README.md del proyecto

---

## 📜 Disclaimer Legal

Este proyecto utiliza enlaces de afiliados. Cuando realizas una compra a través de estos enlaces, podemos recibir una pequeña comisión sin costo adicional para ti. Esto nos ayuda a mantener y mejorar el proyecto.

**Última actualización**: Octubre 2024

---

> 💡 **Consejo**: Empieza con una plataforma, aprende cómo funciona, y luego expande gradualmente a las otras. ¡El éxito en marketing de afiliados requiere paciencia y consistencia!

**¡Buena suerte con tu proyecto de monetización!** 🚀
