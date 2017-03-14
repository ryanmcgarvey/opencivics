exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: "js/app.js"
    },
    stylesheets: {
      joinTo: "css/app.css",
      order: {
        after: ["web/static/css/app.scss"] // concat app.css last
      }
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    assets: [
      /^(web\/static\/assets)/,
      /^(node_modules\/font-awesome)/
    ]
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: [
      "web/static",
      "test/static",
      'node_modules/font-awesome/fonts/fontawesome-webfont.eot',
      'node_modules/font-awesome/fonts/fontawesome-webfont.svg',
      'node_modules/font-awesome/fonts/fontawesome-webfont.ttf',
      'node_modules/font-awesome/fonts/fontawesome-webfont.woff',
      'node_modules/font-awesome/fonts/fontawesome-webfont.woff2'
    ],

    // Where to compile files to
    public: "priv/static"
  },

  plugins: {
    babel: {
      ignore: [/web\/static\/vendor/]
    },
    copycat: {
      "fonts": ["node_modules/font-awesome/fonts"]
    },
    sass: {
      options: {
        includePaths: ["node_modules/font-awesome/scss", "node_modules/tether/src/css"],
        precision: 8
      }
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["web/static/js/app"],

    }
  },

  npm: {
    enabled: true,
    globals: { // bootstrap-sass' JavaScript requires both '$' and 'jQuery' in global scope
      $: 'jquery',
      jQuery: 'jquery',
      Tether: 'tether'
    },
  }
}
