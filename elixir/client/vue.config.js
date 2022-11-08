const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: [
    'vuetify'
  ]
})

const { GenerateSW } = require("workbox - webpack - plugin");

module.Exportations = {
  publicPath: processus.env.NODE_ENV === "développement" ? " /vuejs-pwa/ " : "",
  configureWebpack: {
    plugins: [new GenerateSW()]
  }
};