[33mcommit 4c41db2c00135fd92f7030a719a90e9d61a249e5[m
Author: sijinchan1 <www.jiandanbear@qq.com>
Date:   Mon Mar 10 10:07:06 2025 +0800

    IBPMS

[1mdiff --git a/.gitignore b/.gitignore[m
[1mnew file mode 100644[m
[1mindex 0000000..a547bf3[m
[1m--- /dev/null[m
[1m+++ b/.gitignore[m
[36m@@ -0,0 +1,24 @@[m
[32m+[m[32m# Logs[m
[32m+[m[32mlogs[m
[32m+[m[32m*.log[m
[32m+[m[32mnpm-debug.log*[m
[32m+[m[32myarn-debug.log*[m
[32m+[m[32myarn-error.log*[m
[32m+[m[32mpnpm-debug.log*[m
[32m+[m[32mlerna-debug.log*[m
[32m+[m
[32m+[m[32mnode_modules[m
[32m+[m[32mdist[m
[32m+[m[32mdist-ssr[m
[32m+[m[32m*.local[m
[32m+[m
[32m+[m[32m# Editor directories and files[m
[32m+[m[32m.vscode/*[m
[32m+[m[32m!.vscode/extensions.json[m
[32m+[m[32m.idea[m
[32m+[m[32m.DS_Store[m
[32m+[m[32m*.suo[m
[32m+[m[32m*.ntvs*[m
[32m+[m[32m*.njsproj[m
[32m+[m[32m*.sln[m
[32m+[m[32m*.sw?[m
[1mdiff --git a/README.md b/README.md[m
[1mnew file mode 100644[m
[1mindex 0000000..40ede56[m
[1m--- /dev/null[m
[1m+++ b/README.md[m
[36m@@ -0,0 +1,54 @@[m
[32m+[m[32m# React + TypeScript + Vite[m
[32m+[m
[32m+[m[32mThis template provides a minimal setup to get React working in Vite with HMR and some ESLint rules.[m
[32m+[m
[32m+[m[32mCurrently, two official plugins are available:[m
[32m+[m
[32m+[m[32m- [@vitejs/plugin-react](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react/README.md) uses [Babel](https://babeljs.io/) for Fast Refresh[m
[32m+[m[32m- [@vitejs/plugin-react-swc](https://github.com/vitejs/vite-plugin-react-swc) uses [SWC](https://swc.rs/) for Fast Refresh[m
[32m+[m
[32m+[m[32m## Expanding the ESLint configuration[m
[32m+[m
[32m+[m[32mIf you are developing a production application, we recommend updating the configuration to enable type-aware lint rules:[m
[32m+[m
[32m+[m[32m```js[m
[32m+[m[32mexport default tseslint.config({[m
[32m+[m[32m  extends: [[m
[32m+[m[32m    // Remove ...tseslint.configs.recommended and replace with this[m
[32m+[m[32m    ...tseslint.configs.recommendedTypeChecked,[m
[32m+[m[32m    // Alternatively, use this for stricter rules[m
[32m+[m[32m    ...tseslint.configs.strictTypeChecked,[m
[32m+[m[32m    // Optionally, add this for stylistic rules[m
[32m+[m[32m    ...tseslint.configs.stylisticTypeChecked,[m
[32m+[m[32m  ],[m
[32m+[m[32m  languageOptions: {[m
[32m+[m[32m    // other options...[m
[32m+[m[32m    parserOptions: {[m
[32m+[m[32m      project: ['./tsconfig.node.json', './tsconfig.app.json'],[m
[32m+[m[32m      tsconfigRootDir: import.meta.dirname,[m
[32m+[m[32m    },[m
[32m+[m[32m  },[m
[32m+[m[32m})[m
[32m+[m[32m```[m
[32m+[m
[32m+[m[32mYou can also install [eslint-plugin-react-x](https://github.com/Rel1cx/eslint-react/tree/main/packages/plugins/eslint-plugin-react-x) and [eslint-plugin-react-dom](https://github.com/Rel1cx/eslint-react/tree/main/packages/plugins/eslint-plugin-react-dom) for React-specific lint rules:[m
[32m+[m
[32m+[m[32m```js[m
[32m+[m[32m// eslint.config.js[m
[32m+[m[32mimport reactX from 'eslint-plugin-react-x'[m
[32m+[m[32mimport reactDom from 'eslint-plugin-react-dom'[m
[32m+[m
[32m+[m[32mexport default tseslint.config({[m
[32m+[m[32m  plugins: {[m
[32m+[m[32m    // Add the react-x and react-dom plugins[m
[32m+[m[32m    'react-x': reactX,[m
[32m+[m[32m    'react-dom': reactDom,[m
[32m+[m[32m  },[m
[32m+[m[32m  rules: {[m
[32m+[m[32m    // other rules...[m
[32m+[m[32m    // Enable its recommended typescript rules[m
[32m+[m[32m    ...reactX.configs['recommended-typescript'].rules,[m
[32m+[m[32m    ...reactDom.configs.recommended.rules,[m
[32m+[m[32m  },[m
[32m+[m[32m})[m
[32m+[m[32m```[m
[1mdiff --git a/eslint.config.js b/eslint.config.js[m
[1mnew file mode 100644[m
[1mindex 0000000..092408a[m
[1m--- /dev/null[m
[1m+++ b/eslint.config.js[m
[36m@@ -0,0 +1,28 @@[m
[32m+[m[32mimport js from '@eslint/js'[m
[32m+[m[32mimport globals from 'globals'[m
[32m+[m[32mimport reactHooks from 'eslint-plugin-react-hooks'[m
[32m+[m[32mimport reactRefresh from 'eslint-plugin-react-refresh'[m
[32m+[m[32mimport tseslint from 'typescript-eslint'[m
[32m+[m
[32m+[m[32mexport default tseslint.config([m
[32m+[m[32m  { ignores: ['dist'] },[m
[32m+[m[32m  {[m
[32m+[m[32m    extends: [js.configs.recommended, ...tseslint.configs.recommended],[m
[32m+[m[32m    files: ['**/*.{ts,tsx}'],[m
[32m+[m[32m    languageOptions: {[m
[32m+[m[32m      ecmaVersion: 2020,[m
[32m+[m[32m      globals: globals.browser,[m
[32m+[m[32m    },[m
[32m+[m[32m    plugins: {[m
[32m+[m[32m      'react-hooks': reactHooks,[m
[32m+[m[32m      'react-refresh': reactRefresh,[m
[32m+[m[32m    },[m
[32m+[m[32m    rules: {[m
[32m+[m[32m      ...reactHooks.configs.recommended.rules,[m
[32m+[m[32m      'react-refresh/only-export-components': [[m
[32m+[m[32m        'warn',[m
[32m+[m[32m        { allowConstantExport: true },[m
[32m+[m[32m      ],[m
[32m+[m[32m    },[m
[32m+[m[32m  },[m
[32m+[m[32m)[m
[1mdiff --git a/index.html b/index.html[m
[1mnew file mode 100644[m
[1mindex 0000000..1d7c1a8[m
[1m--- /dev/null[m
[1m+++ b/index.html[m
[36m@@ -0,0 +1,13 @@[m
[32m+[m[32m<!doctype html>[m
[32m+[m[32m<html lang="en">[m
[32m+[m[32m  <head>[m
[32m+[m[32m    <meta charset="UTF-8" />[m
[32m+[m[32m    <link rel="icon" type="image/svg+xml" href="/ai-tech-blue.svg" />[m
[32m+[m[32m    <meta name="viewport" content="width=device-width, initial-scale=1.0" />[m
[32m+[m[32m    <title>智能业务流程建模系统</title>[m
[32m+[m[32m  </head>[m
[32m+[m[32m  <body>[m
[32m+[m[32m    <div id="root"></div>[m
[32m+[m[32m    <script type="module" src="/src/main.tsx"></script>[m
[32m+[m[32m  </body>[m
[32m+[m[32m</html>[m
\ No newline at end of file[m
[1mdiff --git a/package-lock.json b/package-lock.json[m
[1mnew file mode 100644[m
[1mindex 0000000..3f17dff[m
[1m--- /dev/null[m
[1m+++ b/package-lock.json[m
[36m@@ -0,0 +1,4877 @@[m
[32m+[m[32m{[m
[32m+[m[32m  "name": "iabpms",[m
[32m+[m[32m  "version": "0.0.0",[m
[32m+[m[32m  "lockfileVersion": 3,[m
[32m+[m[32m  "requires": true,[m
[32m+[m[32m  "packages": {[m
[32m+[m[32m    "": {[m
[32m+[m[32m      "name": "iabpms",[m
[32m+[m[32m      "version": "0.0.0",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@ant-design/icons": "^5.6.1",[m
[32m+[m[32m        "@bpmn-io/element-template-chooser": "^1.0.0",[m
[32m+[m[32m        "@bpmn-io/properties-panel": "^3.26.3",[m
[32m+[m[32m        "antd": "^5.24.3",[m
[32m+[m[32m        "bpmn-js": "^18.3.1",[m
[32m+[m[32m        "react": "^19.0.0",[m
[32m+[m[32m        "react-dom": "^19.0.0",[m
[32m+[m[32m        "react-router-dom": "^7.3.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "devDependencies": {[m
[32m+[m[32m        "@eslint/js": "^9.21.0",[m
[32m+[m[32m        "@types/node": "^22.13.10",[m
[32m+[m[32m        "@types/react": "^19.0.10",[m
[32m+[m[32m        "@types/react-dom": "^19.0.4",[m
[32m+[m[32m        "@vitejs/plugin-react": "^4.3.4",[m
[32m+[m[32m        "eslint": "^9.21.0",[m
[32m+[m[32m        "eslint-plugin-react-hooks": "^5.1.0",[m
[32m+[m[32m        "eslint-plugin-react-refresh": "^0.4.19",[m
[32m+[m[32m        "globals": "^15.15.0",[m
[32m+[m[32m        "typescript": "~5.7.2",[m
[32m+[m[32m        "typescript-eslint": "^8.24.1",[m
[32m+[m[32m        "vite": "^6.2.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@ampproject/remapping": {[m
[32m+[m[32m      "version": "2.3.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@ampproject/remapping/-/remapping-2.3.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-30iZtAPgz+LTIYoeivqYo853f02jBYSd5uGnGpkFV0M3xOt9aN73erkgYAmZU43x4VfqcnLxW9Kpg3R5LC4YYw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "Apache-2.0",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@jridgewell/gen-mapping": "^0.3.5",[m
[32m+[m[32m        "@jridgewell/trace-mapping": "^0.3.24"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@ant-design/colors": {[m
[32m+[m[32m      "version": "7.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@ant-design/colors/-/colors-7.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-bjTObSnZ9C/O8MB/B4OUtd/q9COomuJAR2SYfhxLyHvCKn4EKwCN3e+fWGMo7H5InAyV0wL17jdE9ALrdOW/6A==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@ant-design/fast-color": "^2.0.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@ant-design/cssinjs": {[m
[32m+[m[32m      "version": "1.23.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@ant-design/cssinjs/-/cssinjs-1.23.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-7GAg9bD/iC9ikWatU9ym+P9ugJhi/WbsTWzcKN6T4gU0aehsprtke1UAaaSxxkjjmkJb3llet/rbUSLPgwlY4w==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/runtime": "^7.11.1",[m
[32m+[m[32m        "@emotion/hash": "^0.8.0",[m
[32m+[m[32m        "@emotion/unitless": "^0.7.5",[m
[32m+[m[32m        "classnames": "^2.3.1",[m
[32m+[m[32m        "csstype": "^3.1.3",[m
[32m+[m[32m        "rc-util": "^5.35.0",[m
[32m+[m[32m        "stylis": "^4.3.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "react": ">=16.0.0",[m
[32m+[m[32m        "react-dom": ">=16.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@ant-design/cssinjs-utils": {[m
[32m+[m[32m      "version": "1.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@ant-design/cssinjs-utils/-/cssinjs-utils-1.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-nOoQMLW1l+xR1Co8NFVYiP8pZp3VjIIzqV6D6ShYF2ljtdwWJn5WSsH+7kvCktXL/yhEtWURKOfH5Xz/gzlwsg==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@ant-design/cssinjs": "^1.21.0",[m
[32m+[m[32m        "@babel/runtime": "^7.23.2",[m
[32m+[m[32m        "rc-util": "^5.38.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "react": ">=16.9.0",[m
[32m+[m[32m        "react-dom": ">=16.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@ant-design/fast-color": {[m
[32m+[m[32m      "version": "2.0.6",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@ant-design/fast-color/-/fast-color-2.0.6.tgz",[m
[32m+[m[32m      "integrity": "sha512-y2217gk4NqL35giHl72o6Zzqji9O7vHh9YmhUVkPtAOpoTCH4uWxo/pr4VE8t0+ChEPs0qo4eJRC5Q1eXWo3vA==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/runtime": "^7.24.7"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8.x"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@ant-design/icons": {[m
[32m+[m[32m      "version": "5.6.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@ant-design/icons/-/icons-5.6.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-0/xS39c91WjPAZOWsvi1//zjx6kAp4kxWwctR6kuU6p133w8RU0D2dSCvZC19uQyharg/sAvYxGYWl01BbZZfg==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@ant-design/colors": "^7.0.0",[m
[32m+[m[32m        "@ant-design/icons-svg": "^4.4.0",[m
[32m+[m[32m        "@babel/runtime": "^7.24.8",[m
[32m+[m[32m        "classnames": "^2.2.6",[m
[32m+[m[32m        "rc-util": "^5.31.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "react": ">=16.0.0",[m
[32m+[m[32m        "react-dom": ">=16.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@ant-design/icons-svg": {[m
[32m+[m[32m      "version": "4.4.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@ant-design/icons-svg/-/icons-svg-4.4.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-vHbT+zJEVzllwP+CM+ul7reTEfBR0vgxFe7+lREAsAA7YGsYpboiq2sQNeQeRvh09GfQgs/GyFEvZpJ9cLXpXA==",[m
[32m+[m[32m      "license": "MIT"[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@ant-design/react-slick": {[m
[32m+[m[32m      "version": "1.1.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@ant-design/react-slick/-/react-slick-1.1.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-EzlvzE6xQUBrZuuhSAFTdsr4P2bBBHGZwKFemEfq8gIGyIQCxalYfZW/T2ORbtQx5rU69o+WycP3exY/7T1hGA==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/runtime": "^7.10.4",[m
[32m+[m[32m        "classnames": "^2.2.5",[m
[32m+[m[32m        "json2mq": "^0.2.0",[m
[32m+[m[32m        "resize-observer-polyfill": "^1.5.1",[m
[32m+[m[32m        "throttle-debounce": "^5.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "react": ">=16.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/code-frame": {[m
[32m+[m[32m      "version": "7.26.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/code-frame/-/code-frame-7.26.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-RJlIHRueQgwWitWgF8OdFYGZX328Ax5BCemNGlqHfplnRT9ESi8JkFlvaVYbS+UubVY6dpv87Fs2u5M29iNFVQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/helper-validator-identifier": "^7.25.9",[m
[32m+[m[32m        "js-tokens": "^4.0.0",[m
[32m+[m[32m        "picocolors": "^1.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/compat-data": {[m
[32m+[m[32m      "version": "7.26.8",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/compat-data/-/compat-data-7.26.8.tgz",[m
[32m+[m[32m      "integrity": "sha512-oH5UPLMWR3L2wEFLnFJ1TZXqHufiTKAiLfqw5zkhS4dKXLJ10yVztfil/twG8EDTA4F/tvVNw9nOl4ZMslB8rQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/core": {[m
[32m+[m[32m      "version": "7.26.9",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/core/-/core-7.26.9.tgz",[m
[32m+[m[32m      "integrity": "sha512-lWBYIrF7qK5+GjY5Uy+/hEgp8OJWOD/rpy74GplYRhEauvbHDeFB8t5hPOZxCZ0Oxf4Cc36tK51/l3ymJysrKw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@ampproject/remapping": "^2.2.0",[m
[32m+[m[32m        "@babel/code-frame": "^7.26.2",[m
[32m+[m[32m        "@babel/generator": "^7.26.9",[m
[32m+[m[32m        "@babel/helper-compilation-targets": "^7.26.5",[m
[32m+[m[32m        "@babel/helper-module-transforms": "^7.26.0",[m
[32m+[m[32m        "@babel/helpers": "^7.26.9",[m
[32m+[m[32m        "@babel/parser": "^7.26.9",[m
[32m+[m[32m        "@babel/template": "^7.26.9",[m
[32m+[m[32m        "@babel/traverse": "^7.26.9",[m
[32m+[m[32m        "@babel/types": "^7.26.9",[m
[32m+[m[32m        "convert-source-map": "^2.0.0",[m
[32m+[m[32m        "debug": "^4.1.0",[m
[32m+[m[32m        "gensync": "^1.0.0-beta.2",[m
[32m+[m[32m        "json5": "^2.2.3",[m
[32m+[m[32m        "semver": "^6.3.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "opencollective",[m
[32m+[m[32m        "url": "https://opencollective.com/babel"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/generator": {[m
[32m+[m[32m      "version": "7.26.9",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/generator/-/generator-7.26.9.tgz",[m
[32m+[m[32m      "integrity": "sha512-kEWdzjOAUMW4hAyrzJ0ZaTOu9OmpyDIQicIh0zg0EEcEkYXZb2TjtBhnHi2ViX7PKwZqF4xwqfAm299/QMP3lg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/parser": "^7.26.9",[m
[32m+[m[32m        "@babel/types": "^7.26.9",[m
[32m+[m[32m        "@jridgewell/gen-mapping": "^0.3.5",[m
[32m+[m[32m        "@jridgewell/trace-mapping": "^0.3.25",[m
[32m+[m[32m        "jsesc": "^3.0.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-compilation-targets": {[m
[32m+[m[32m      "version": "7.26.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-compilation-targets/-/helper-compilation-targets-7.26.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-IXuyn5EkouFJscIDuFF5EsiSolseme1s0CZB+QxVugqJLYmKdxI1VfIBOst0SUu4rnk2Z7kqTwmoO1lp3HIfnA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/compat-data": "^7.26.5",[m
[32m+[m[32m        "@babel/helper-validator-option": "^7.25.9",[m
[32m+[m[32m        "browserslist": "^4.24.0",[m
[32m+[m[32m        "lru-cache": "^5.1.1",[m
[32m+[m[32m        "semver": "^6.3.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-module-imports": {[m
[32m+[m[32m      "version": "7.25.9",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-module-imports/-/helper-module-imports-7.25.9.tgz",[m
[32m+[m[32m      "integrity": "sha512-tnUA4RsrmflIM6W6RFTLFSXITtl0wKjgpnLgXyowocVPrbYrLUXSBXDgTs8BlbmIzIdlBySRQjINYs2BAkiLtw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/traverse": "^7.25.9",[m
[32m+[m[32m        "@babel/types": "^7.25.9"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-module-transforms": {[m
[32m+[m[32m      "version": "7.26.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-module-transforms/-/helper-module-transforms-7.26.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-xO+xu6B5K2czEnQye6BHA7DolFFmS3LB7stHZFaOLb1pAwO1HWLS8fXA+eh0A2yIvltPVmx3eNNDBJA2SLHXFw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/helper-module-imports": "^7.25.9",[m
[32m+[m[32m        "@babel/helper-validator-identifier": "^7.25.9",[m
[32m+[m[32m        "@babel/traverse": "^7.25.9"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "@babel/core": "^7.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-plugin-utils": {[m
[32m+[m[32m      "version": "7.26.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-plugin-utils/-/helper-plugin-utils-7.26.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-RS+jZcRdZdRFzMyr+wcsaqOmld1/EqTghfaBGQQd/WnRdzdlvSZ//kF7U8VQTxf1ynZ4cjUcYgjVGx13ewNPMg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-string-parser": {[m
[32m+[m[32m      "version": "7.25.9",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-string-parser/-/helper-string-parser-7.25.9.tgz",[m
[32m+[m[32m      "integrity": "sha512-4A/SCr/2KLd5jrtOMFzaKjVtAei3+2r/NChoBNoZ3EyP/+GlhoaEGoWOZUmFmoITP7zOJyHIMm+DYRd8o3PvHA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-validator-identifier": {[m
[32m+[m[32m      "version": "7.25.9",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-validator-identifier/-/helper-validator-identifier-7.25.9.tgz",[m
[32m+[m[32m      "integrity": "sha512-Ed61U6XJc3CVRfkERJWDz4dJwKe7iLmmJsbOGu9wSloNSFttHV0I8g6UAgb7qnK5ly5bGLPd4oXZlxCdANBOWQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helper-validator-option": {[m
[32m+[m[32m      "version": "7.25.9",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helper-validator-option/-/helper-validator-option-7.25.9.tgz",[m
[32m+[m[32m      "integrity": "sha512-e/zv1co8pp55dNdEcCynfj9X7nyUKUXoUEwfXqaZt0omVOmDe9oOTdKStH4GmAw6zxMFs50ZayuMfHDKlO7Tfw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/helpers": {[m
[32m+[m[32m      "version": "7.26.9",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/helpers/-/helpers-7.26.9.tgz",[m
[32m+[m[32m      "integrity": "sha512-Mz/4+y8udxBKdmzt/UjPACs4G3j5SshJJEFFKxlCGPydG4JAHXxjWjAwjd09tf6oINvl1VfMJo+nB7H2YKQ0dA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/template": "^7.26.9",[m
[32m+[m[32m        "@babel/types": "^7.26.9"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/parser": {[m
[32m+[m[32m      "version": "7.26.9",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/parser/-/parser-7.26.9.tgz",[m
[32m+[m[32m      "integrity": "sha512-81NWa1njQblgZbQHxWHpxxCzNsa3ZwvFqpUg7P+NNUU6f3UU2jBEg4OlF/J6rl8+PQGh1q6/zWScd001YwcA5A==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/types": "^7.26.9"[m
[32m+[m[32m      },[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "parser": "bin/babel-parser.js"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/plugin-transform-react-jsx-self": {[m
[32m+[m[32m      "version": "7.25.9",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/plugin-transform-react-jsx-self/-/plugin-transform-react-jsx-self-7.25.9.tgz",[m
[32m+[m[32m      "integrity": "sha512-y8quW6p0WHkEhmErnfe58r7x0A70uKphQm8Sp8cV7tjNQwK56sNVK0M73LK3WuYmsuyrftut4xAkjjgU0twaMg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/helper-plugin-utils": "^7.25.9"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "@babel/core": "^7.0.0-0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/plugin-transform-react-jsx-source": {[m
[32m+[m[32m      "version": "7.25.9",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/plugin-transform-react-jsx-source/-/plugin-transform-react-jsx-source-7.25.9.tgz",[m
[32m+[m[32m      "integrity": "sha512-+iqjT8xmXhhYv4/uiYd8FNQsraMFZIfxVSqxxVSZP0WbbSAWvBXAul0m/zu+7Vv4O/3WtApy9pmaTMiumEZgfg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/helper-plugin-utils": "^7.25.9"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "@babel/core": "^7.0.0-0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/runtime": {[m
[32m+[m[32m      "version": "7.26.9",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/runtime/-/runtime-7.26.9.tgz",[m
[32m+[m[32m      "integrity": "sha512-aA63XwOkcl4xxQa3HjPMqOP6LiK0ZDv3mUPYEFXkpHbaFjtGggE1A61FjFzJnB+p7/oy2gA8E+rcBNl/zC1tMg==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "regenerator-runtime": "^0.14.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/template": {[m
[32m+[m[32m      "version": "7.26.9",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/template/-/template-7.26.9.tgz",[m
[32m+[m[32m      "integrity": "sha512-qyRplbeIpNZhmzOysF/wFMuP9sctmh2cFzRAZOn1YapxBsE1i9bJIY586R/WBLfLcmcBlM8ROBiQURnnNy+zfA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/code-frame": "^7.26.2",[m
[32m+[m[32m        "@babel/parser": "^7.26.9",[m
[32m+[m[32m        "@babel/types": "^7.26.9"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/traverse": {[m
[32m+[m[32m      "version": "7.26.9",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/traverse/-/traverse-7.26.9.tgz",[m
[32m+[m[32m      "integrity": "sha512-ZYW7L+pL8ahU5fXmNbPF+iZFHCv5scFak7MZ9bwaRPLUhHh7QQEMjZUg0HevihoqCM5iSYHN61EyCoZvqC+bxg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/code-frame": "^7.26.2",[m
[32m+[m[32m        "@babel/generator": "^7.26.9",[m
[32m+[m[32m        "@babel/parser": "^7.26.9",[m
[32m+[m[32m        "@babel/template": "^7.26.9",[m
[32m+[m[32m        "@babel/types": "^7.26.9",[m
[32m+[m[32m        "debug": "^4.3.1",[m
[32m+[m[32m        "globals": "^11.1.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/traverse/node_modules/globals": {[m
[32m+[m[32m      "version": "11.12.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/globals/-/globals-11.12.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-WOBp/EEGUiIsJSp7wcv/y6MO+lV9UoncWqxuFfm8eBwzWNgyfBd6Gz+IeKQ9jCmyhoH99g15M3T+QaVHFjizVA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/types": {[m
[32m+[m[32m      "version": "7.26.9",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/types/-/types-7.26.9.tgz",[m
[32m+[m[32m      "integrity": "sha512-Y3IR1cRnOxOCDvMmNiym7XpXQ93iGDDPHx+Zj+NM+rg0fBaShfQLkg+hKPaZCEvg5N/LeCo4+Rj/i3FuJsIQaw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/helper-string-parser": "^7.25.9",[m
[32m+[m[32m        "@babel/helper-validator-identifier": "^7.25.9"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@bpmn-io/cm-theme": {[m
[32m+[m[32m      "version": "0.1.0-alpha.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@bpmn-io/cm-theme/-/cm-theme-0.1.0-alpha.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-ZILgiYzxk3KMvxplUXmdRFQo45/JehDPg5k9tWfehmzUOSE13ssyLPil8uCloMQnb3yyzyOWTjb/wzKXTHlFQw==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@codemirror/language": "^6.3.1",[m
[32m+[m[32m        "@codemirror/view": "^6.5.1",[m
[32m+[m[32m        "@lezer/highlight": "^1.1.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "workspaces": {[m
[32m+[m[32m        "packages": [[m
[32m+[m[32m          "preview-themes"[m
[32m+[m[32m        ][m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@bpmn-io/diagram-js-ui": {[m
[32m+[m[32m      "version": "0.2.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@bpmn-io/diagram-js-ui/-/diagram-js-ui-0.2.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-OGyjZKvGK8tHSZ0l7RfeKhilGoOGtFDcoqSGYkX0uhFlo99OVZ9Jn1K7TJGzcE9BdKwvA5Y5kGqHEhdTxHvFfw==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "htm": "^3.1.1",[m
[32m+[m[32m        "preact": "^10.11.2"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@bpmn-io/element-template-chooser": {[m
[32m+[m[32m      "version": "1.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@bpmn-io/element-template-chooser/-/element-template-chooser-1.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-jSzvoWwYiTpsR7X/+nhao8e8jfveTPLeT3cUUJYhcztLysJaJo+5VXX+QbzH4eFOCnqaoIz6ehbd8px4EjVYnA==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "bpmn-js": ">= 11",[m
[32m+[m[32m        "diagram-js": ">= 11.3.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@bpmn-io/feel-editor": {[m
[32m+[m[32m      "version": "1.10.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@bpmn-io/feel-editor/-/feel-editor-1.10.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-Unc4CSyMgDg5c2C3E3ehEbJZfyo5W9Zrq74C8cp7mjFbb3if6rTBaw3ZCZeiC06zsm881sI5P8zWHFdIhKo/vA==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@bpmn-io/feel-lint": "^1.4.0",[m
[32m+[m[32m        "@codemirror/autocomplete": "^6.16.2",[m
[32m+[m[32m        "@codemirror/commands": "^6.8.0",[m
[32m+[m[32m        "@codemirror/language": "^6.10.2",[m
[32m+[m[32m        "@codemirror/lint": "^6.8.4",[m
[32m+[m[32m        "@codemirror/state": "^6.5.1",[m
[32m+[m[32m        "@codemirror/view": "^6.36.2",[m
[32m+[m[32m        "@lezer/highlight": "^1.2.1",[m
[32m+[m[32m        "lang-feel": "^2.3.0",[m
[32m+[m[32m        "min-dom": "^4.2.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 16"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@bpmn-io/feel-lint": {[m
[32m+[m[32m      "version": "1.4.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@bpmn-io/feel-lint/-/feel-lint-1.4.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-1bsdR/9vPD7RQVqWWPk0X0tpjLsYTDrCxIzOVtN/h32o4nPGl0dZBU5m07qaFUGD4wG3eOH4Qim1wexHG8YkBw==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@codemirror/language": "^6.10.8",[m
[32m+[m[32m        "lezer-feel": "^1.7.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "*"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@bpmn-io/properties-panel": {[m
[32m+[m[32m      "version": "3.26.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@bpmn-io/properties-panel/-/properties-panel-3.26.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-iyBas5/Hn/+yZ/FPYpoGIpXe7os/rpwhnWqAwum0Lj/JSzlSfYEAfljZ++VHHDrnFo3DP8vSeRKkjKbXndP2jA==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@bpmn-io/feel-editor": "^1.10.0",[m
[32m+[m[32m        "@codemirror/view": "^6.28.1",[m
[32m+[m[32m        "classnames": "^2.3.1",[m
[32m+[m[32m        "feelers": "^1.4.0",[m
[32m+[m[32m        "focus-trap": "^7.5.2",[m
[32m+[m[32m        "min-dash": "^4.1.1",[m
[32m+[m[32m        "min-dom": "^4.0.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "*"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@codemirror/autocomplete": {[m
[32m+[m[32m      "version": "6.18.6",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@codemirror/autocomplete/-/autocomplete-6.18.6.tgz",[m
[32m+[m[32m      "integrity": "sha512-PHHBXFomUs5DF+9tCOM/UoW6XQ4R44lLNNhRaW9PKPTU0D7lIjRg3ElxaJnTwsl/oHiR93WSXDBrekhoUGCPtg==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@codemirror/language": "^6.0.0",[m
[32m+[m[32m        "@codemirror/state": "^6.0.0",[m
[32m+[m[32m        "@codemirror/view": "^6.17.0",[m
[32m+[m[32m        "@lezer/common": "^1.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@codemirror/commands": {[m
[32m+[m[32m      "version": "6.8.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@codemirror/commands/-/commands-6.8.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-q8VPEFaEP4ikSlt6ZxjB3zW72+7osfAYW9i8Zu943uqbKuz6utc1+F170hyLUCUltXORjQXRyYQNfkckzA/bPQ==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@codemirror/language": "^6.0.0",[m
[32m+[m[32m        "@codemirror/state": "^6.4.0",[m
[32m+[m[32m        "@codemirror/view": "^6.27.0",[m
[32m+[m[32m        "@lezer/common": "^1.1.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@codemirror/language": {[m
[32m+[m[32m      "version": "6.10.8",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@codemirror/language/-/language-6.10.8.tgz",[m
[32m+[m[32m      "integrity": "sha512-wcP8XPPhDH2vTqf181U8MbZnW+tDyPYy0UzVOa+oHORjyT+mhhom9vBd7dApJwoDz9Nb/a8kHjJIsuA/t8vNFw==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@codemirror/state": "^6.0.0",[m
[32m+[m[32m        "@codemirror/view": "^6.23.0",[m
[32m+[m[32m        "@lezer/common": "^1.1.0",[m
[32m+[m[32m        "@lezer/highlight": "^1.0.0",[m
[32m+[m[32m        "@lezer/lr": "^1.0.0",[m
[32m+[m[32m        "style-mod": "^4.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@codemirror/lint": {[m
[32m+[m[32m      "version": "6.8.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@codemirror/lint/-/lint-6.8.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-u4q7PnZlJUojeRe8FJa/njJcMctISGgPQ4PnWsd9268R4ZTtU+tfFYmwkBvgcrK2+QQ8t