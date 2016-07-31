module.exports = {
  'parserOptions': {
    'ecmaVersion': 6,
    'sourceType': 'module',
    'ecmaFeatures': {
      'jsx': true
    }
  },
  'rules': {
    'indent': [2, 2],
    'quotes': [2, 'single'],
    'linebreak-style': [2, 'unix'],
    'semi': [2, 'always'],
    'no-console': 0
  },
  'env': {
    'es6': true,
    'node': true,
    'mocha': true,
    'browser': true
  },
  'extends': [
    'eslint:recommended',
    'plugin:react/recommended'
  ],
  'plugins': [
    'react'
  ]
};
