var AuthManager = require('../../config/auth_manager');
var AuthenticatedRoute = require('../authenticated_route');

var SettingsProfileRoute = AuthenticatedRoute.extend({
  model: function() {
    return App.AuthManager.get('apiKey.user');
  }
});

module.exports = SettingsProfileRoute;