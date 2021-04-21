const Image = require("@11ty/eleventy-img");
my_image = function(src, alt, sizes) {
  let options = {
    widths: sizes,
    formats: ["avif", "webp", "jpeg"],
    outputDir: '_site/img'
  }
  Image(src, options)
  return Image.generateHTML(Image.statsSync(src, options),
    {
      alt: alt,
      sizes: sizes,
      loading: "lazy",
      decoding: "async",
    }
  )
}
module.exports = function(eleventyConfig) {
  eleventyConfig.setPugOptions({
    globals: ['my_image']
  });
};
