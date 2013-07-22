var LtiApp = require('../../models/lti_app');

var AppsShowRoute = Ember.Route.extend({
  model: function(params) {
    return LtiApp.find(params.app_id);
  },

  serialize: function(model, params) {
    return { app_id: model.get('short_name') };
  }
});

module.exports = AppsShowRoute;

