var LtiApp = require('../../models/lti_app');

var AppsIndexRoute = Ember.Route.extend({
  model: function() {
    return LtiApp.find();
  }
});

module.exports = AppsIndexRoute;

