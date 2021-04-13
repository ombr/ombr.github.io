const CleanCSS = require("clean-css");
const sass = require('sass');

code = `h1
  font-size: 40px
`
console.log(sass.renderSync({ data: code, indentedSyntax: true }).css.toString())
module.exports = function(eleventyConfig) {
  eleventyConfig.setPugOptions({
    filters: {
      sass: function(code, options) {
        return new CleanCSS({}).minify(
          sass.renderSync({
            data: code,
            indentedSyntax: true
          }).css.toString()
        ).styles;
      }
    }
  });
};
