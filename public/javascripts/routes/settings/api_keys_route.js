var AuthenticatedRoute = require('../authenticated_route');
var ApiKey = require('../../models/api_key');

var SettingsApiKeysRoute = AuthenticatedRoute.extend({
  model: function() {
    return ApiKey.find();
  }
});

module.exports = SettingsApiKeysRoute;

