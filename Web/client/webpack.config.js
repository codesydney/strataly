module.exports = {
  module: {
    rules: [
      // ... other rules omitted

      // this will apply to both plain `.scss` files
      // AND `<style lang="scss">` blocks in `.vue` files
      {
        test: /\.scss$/,
        use: [
          'vue-style-loader',
          'css-loader',
          {
            loader: 'sass-loader',

            options: {
              // This is the path to your variables
              prependData: "@import '@/assets/scss/variables.scss';"
            }
          }
        ]
      }
    ]
  }
  // plugin omitted
}
