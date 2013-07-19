var UserPasswordForm = require('../../lib/user_password_form');
var AuthenticatedRoute = require('../authenticated_route');

var SettingsAccountSettingsRoute = AuthenticatedRoute.extend({
  model: function() {
    return new UserPasswordForm;
  }
});

module.exports = SettingsAccountSettingsRoute;

