/**
 * Configuración de Enlaces de Afiliados
 * 
 * Este archivo contiene los IDs y configuraciones para los programas de afiliados.
 * Reemplaza los valores 'YOUR_XXXXX_ID' con tus IDs de afiliado reales.
 * 
 * Para obtener estos IDs, consulta el archivo README_MONETIZACION.md
 */

const affiliatesConfig = {
  // Booking.com Affiliate Program
  booking: {
    aid: 'YOUR_BOOKING_AID',  // Tu Affiliate ID de Booking.com
    label: 'YOUR_BOOKING_LABEL',  // Tu etiqueta personalizada
    baseUrl: 'https://www.booking.com/searchresults.html',
    enabled: false  // Cambiar a true cuando tengas tu ID
  },

  // GetYourGuide Affiliate Program
  getYourGuide: {
    partnerId: 'YOUR_GETYOURGUIDE_PARTNER_ID',
    baseUrl: 'https://www.getyourguide.com',
    enabled: false  // Cambiar a true cuando tengas tu ID
  },

  // Civitatis Affiliate Program
  civitatis: {
    affiliateId: 'YOUR_CIVITATIS_AFFILIATE_ID',
    baseUrl: 'https://www.civitatis.com',
    enabled: false  // Cambiar a true cuando tengas tu ID
  },

  // Amazon Associates
  amazon: {
    tag: 'YOUR_AMAZON_ASSOCIATE_TAG',  // Tu Amazon Associate Tag (ej: misrutas-21)
    marketplace: 'es',  // es, com, co.uk, etc.
    baseUrl: 'https://www.amazon.es',
    enabled: false  // Cambiar a true cuando tengas tu ID
  }
};

/**
 * Genera URL de afiliado para Booking.com
 * @param {string} destination - Destino a buscar
 * @param {string} checkin - Fecha de entrada (YYYY-MM-DD)
 * @param {string} checkout - Fecha de salida (YYYY-MM-DD)
 */
function getBookingUrl(destination, checkin = '', checkout = '') {
  if (!affiliatesConfig.booking.enabled) {
    return affiliatesConfig.booking.baseUrl;
  }
  
  const params = new URLSearchParams({
    ss: destination,
    aid: affiliatesConfig.booking.aid,
    label: affiliatesConfig.booking.label
  });
  
  if (checkin) params.append('checkin', checkin);
  if (checkout) params.append('checkout', checkout);
  
  return `${affiliatesConfig.booking.baseUrl}?${params.toString()}`;
}

/**
 * Genera URL de afiliado para GetYourGuide
 * @param {string} activity - Slug de la actividad
 */
function getGetYourGuideUrl(activity) {
  if (!affiliatesConfig.getYourGuide.enabled) {
    return affiliatesConfig.getYourGuide.baseUrl;
  }
  
  return `${affiliatesConfig.getYourGuide.baseUrl}/${activity}?partner_id=${affiliatesConfig.getYourGuide.partnerId}`;
}

/**
 * Genera URL de afiliado para Civitatis
 * @param {string} activity - Slug de la actividad
 */
function getCivitatisUrl(activity) {
  if (!affiliatesConfig.civitatis.enabled) {
    return affiliatesConfig.civitatis.baseUrl;
  }
  
  return `${affiliatesConfig.civitatis.baseUrl}/${activity}?aid=${affiliatesConfig.civitatis.affiliateId}`;
}

/**
 * Genera URL de afiliado para Amazon
 * @param {string} asin - ASIN del producto
 */
function getAmazonUrl(asin) {
  if (!affiliatesConfig.amazon.enabled) {
    return affiliatesConfig.amazon.baseUrl;
  }
  
  return `${affiliatesConfig.amazon.baseUrl}/dp/${asin}?tag=${affiliatesConfig.amazon.tag}`;
}

// Exportar configuración y funciones
if (typeof module !== 'undefined' && module.exports) {
  module.exports = {
    affiliatesConfig,
    getBookingUrl,
    getGetYourGuideUrl,
    getCivitatisUrl,
    getAmazonUrl
  };
}
