var User = require('../../models/user');

var UsersShowRoute = Ember.Route.extend({
  model: function() {
    return App.AuthManager.get('apiKey.user');
  }
});

module.exports = UsersShowRoute;

