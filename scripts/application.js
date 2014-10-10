require.config({
  baseUrl: "scripts/app",
  // Do not use a string literal unless the name has a '-' or '.'
  paths: {
    "coffee-script": "../lib/vendor/require-cs/coffee-script",
    cs: "../lib/vendor/require-cs/cs",
    backbone: "../lib/vendor/backbone/backbone-min",
    firebase: 'https://cdn.firebase.com/v0/firebase',
    backfire: 'https://cdn.firebase.com/libs/backfire/0.3.0/backbone-firebase.min',
    'firebase-login': "https://cdn.firebase.com/js/simple-login/1.6.1/firebase-simple-login",
    bootstrap: "../lib/vendor/bootstrap/dist/js/bootstrap.min",
    handlebars: "../lib/vendor/handlebars/handlebars.min",
    hbs: "../lib/vendor/hbars/hbars",
    jquery: "../lib/vendor/jquery/jquery.min",
    "jquery-ui": "../lib/vendor/jquery-ui/ui/minified/jquery-ui.min",
    "jquery-svg": "../lib/vendor/jquery.svg/jquery.svg.min",
    marionette: "../lib/vendor/marionette/lib/backbone.marionette.min",
    'd3': '../lib/vendor/d3/d3.min',
    'nvd3': '../lib/vendor/nvd3/nv.d3.min',
    'venn': '../lib/local/venn',
    'd3Queue': '../lib/local/queue.v1.min',
    'leaflet': '../lib/vendor/leaflet/dist/leaflet',
    'datatables': '../lib/vendor/datatables/media/js/jquery.dataTables',
    'tabletools': '../lib/vendor/datatables-tabletools/src/TableTools',
    'tabletools-bootstrap': '../lib/vendor/dataTables.bootstrap',
    'ZeroClipboard' : '../lib/vendor/datatables-tabletools/src/ZeroClipboard',
    modernizer: "../lib/vendor/modernizr/modernizr",
    text: "../lib/vendor/requirejs-text/text",
    underscore: "../lib/vendor/underscore/underscore-min",
    'plugins' : "../lib/local/plugins",
    verge: "../lib/vendor/verge/verge.min",
    states: 'http://leafletjs.com/examples/us-states'
  },
  // Shims are organized in a loose order of loading
  shim: {
    jquery: {
      exports: "jQuery"
    },
    "jquery-ui": {
      deps: [
        "jquery"
      ],
      exports: "$",
    },
    "jquery-svg": {
      deps: [
        "jquery"
      ]
    },
    bootstrap: {
      deps: [
        "jquery"
      ],
      exports: "bootstrap",
    },
    underscore: {
      exports: "_"
    },
    backbone: {
      deps: [
        "jquery",
        "underscore"
      ],
      exports: "Backbone"
    },
    'backfire': {
        deps: [
          'backbone',
          'firebase'
        ],
        exports: 'Backbone.Firebase'
    },
    marionette: {
      deps: [
        "backbone"
      ],
      exports: "Marionette"
    },
    handlebars: {
      exports: "Handlebars"
    },
    'tabletools': {
      deps: [
        'ZeroClipboard',
        "jquery"
      ],
      exports: 'TableTools'
    },
    'tabletools-bootstrap': {
      deps: [
        'tabletools',
        'bootstrap'
      ],
    },
    'nvd3': {
      deps: [
        "d3"
      ],
      exports: "nvd3"
    },
  },
  hbs: {
    templateExtension: "html",
    helperDirectory: "templates/helpers/",
    i18nDirectory: "templates/i18n/",
    compileOptions: {}
  },
  map: {
    '*': {
      'css': '../../../../../node_modules/require-css/css'
    }
  }
});

require(["marionette", "handlebars", "wvainit"],
  function(a) {
  }
);
