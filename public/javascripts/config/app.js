require('../vendor/jquery');
require('../vendor/jquery.cookie');
require('../vendor/handlebars');
require('../vendor/ember');
require('../vendor/ember-data-latest'); // delete if you don't want ember-data

var App = window.App = Ember.Application.create({ LOG_TRANSITIONS: true });
App.Store = require('./store'); // delete if you don't want ember-data

require('../components/flash');

module.exports = App;

