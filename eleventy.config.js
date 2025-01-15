import path from "node:path";
import htmlmin from "html-minifier-terser";
import * as sass from "sass";
import CleanCSS from "clean-css";
import YAML from "yaml";

export default function (e11tyConfig) {
  e11tyConfig.addExtension("scss", {
    outputFileExtension: "css",
    useLayouts: false,
    compile: async function (inputContent, inputPath) {
      let result = sass.compileString(inputContent, {
        loadPaths: [path.parse(inputPath).dir || ".", this.config.dir.includes],
      });
      this.addDependencies(inputPath, result.loadedUrls);
      const cleaned = new CleanCSS({}).minify(result.css).styles;
      return async (_data) => cleaned;
    },
  });
  e11tyConfig.addTemplateFormats("scss");
  e11tyConfig.addTransform("htmlmin", function (content) {
    if ((this.page.outputPath || "").endsWith(".html")) {
      return htmlmin.minify(content, {
        useShortDoctype: true,
        removeComments: true,
        collapseWhitespace: true,
      });
    }
    return content;
  });
  e11tyConfig.addPassthroughCopy("*.asc");
  e11tyConfig.addDataExtension("yaml", (contents) => YAML.parse(contents));
}
