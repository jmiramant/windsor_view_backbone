({
  mainConfigFile: "scripts/application.js",
  baseUrl: "scripts/app",
  dir: "packaged",
  modules: [
    {
      name: "wvinit",
      include: ["marionette", "handlebars"]
    }
  ]
});