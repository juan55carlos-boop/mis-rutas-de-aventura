// Genera PNG/WebP y favicon a partir de assets/logo.svg
// Requiere: npm i sharp
const sharp = require('sharp');
const fs = require('fs').promises;
const path = require('path');

async function run() {
  const svg = path.resolve(__dirname, '../assets/logo.svg');
  const out = path.resolve(__dirname, '../assets');
  await fs.mkdir(out, { recursive: true });

  const sizes = [512, 192, 128, 64, 32, 16];
  for (const s of sizes) {
    const pngPath = path.join(out, `logo-${s}.png`);
    await sharp(svg).resize(s, s, { fit: 'contain' }).png({ quality: 100 }).toFile(pngPath);
    console.log('Wrote', pngPath);
  }

  // WebP from 512
  await sharp(path.join(out, 'logo-512.png')).webp({ quality: 90 }).toFile(path.join(out, 'logo-512.webp'));
  console.log('Wrote', path.join(out, 'logo-512.webp'));

  // Create a 64x64 PNG for favicon generation
  await sharp(path.join(out, 'logo-64.png')).png().toFile(path.join(out, 'logo-64.png'));
  console.log('Wrote', path.join(out, 'logo-64.png'));

  // Note: creating a multi-resolution .ico reliably requires ImageMagick or a specialized library.
  // We'll write PNGs and let ImageMagick (available on CI) create favicon.ico in the workflow.
}

if (require.main === module) run().catch(err => { console.error(err); process.exit(1); });