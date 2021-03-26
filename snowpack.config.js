module.exports = {
  plugins: ['@snowpack/plugin-postcss'],
  mount: {
    public: '/',
  },
  build: {
    minify: true,
    treeshake: true,
    splitting: true,
  },
};
