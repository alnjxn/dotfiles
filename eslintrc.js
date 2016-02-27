modules.export = {

  env: {
    browser: true,
    node: true,
    es6: true
  },
  parserOptions: {
    ecmaVersion: 6,
    sourceType: 'module',
    ecmaFeatures: {
      jsx: true
    },
  },
  rules: {
    strict: 'global',
    quotes: [2, 'single', 'avoid-escape']
  }

};


