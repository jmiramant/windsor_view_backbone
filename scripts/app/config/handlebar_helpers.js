define(function(require) {
  var Handlebars;
  Handlebars = require('handlebars');
  return Handlebars.registerHelper('parity', function(i) {
    if (i % 2 === 0) {
      return 'even';
    } else {
      return 'odd';
    };
  });
});
