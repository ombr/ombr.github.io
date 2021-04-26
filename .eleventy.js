const Image = require("@11ty/eleventy-img");
const { AssetCache } = require("@11ty/eleventy-cache-assets");
const fs = require('fs');
const child_process = require('child_process');
const svgToMiniDataURI = require('mini-svg-data-uri');

my_svg_placeholder = function (src) {
  const svgPath = src.replace(/\.[^.]+$/, '.svg')
  if(fs.existsSync(svgPath)) {
     return svgToMiniDataURI.toSrcset(fs.readFileSync(svgPath, {encoding:'utf8', flag:'r'}));
  }
  return '';
}
my_image = function(src, cls, alt, sizes, widths) {
  let options = { widths: widths, formats: ["avif", "webp", "jpeg"], outputDir: '_site/img' };
  Image(src, options)
  return Image.generateHTML(Image.statsSync(src, options),
    {
      class: cls,
      alt: alt,
      sizes: sizes,
      loading: "lazy",
      decoding: "async",
      style: `background-image: url(&quot;${my_svg_placeholder(src)}&quot;);`
    }
  )
}
module.exports = function(eleventyConfig) {
  eleventyConfig.setPugOptions({
    globals: ['my_image']
  });
};
