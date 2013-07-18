var ApiKey = require('../../models/api_key');

var SettingsApiKeysRoute = Ember.Route.extend({
  model: function() {
    return ApiKey.find();
  }
});

module.exports = SettingsApiKeysRoute;

