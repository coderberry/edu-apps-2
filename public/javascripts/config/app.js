require('../vendor/jquery');
require('../vendor/jquery.cookie');
require('../vendor/handlebars');
require('../vendor/ember');
require('../vendor/ember-model');

// Ember.LOG_BINDINGS = true;

var App = window.App = Ember.Application.create({ LOG_TRANSITIONS: true });
require('../components/flash');
module.exports = App;
