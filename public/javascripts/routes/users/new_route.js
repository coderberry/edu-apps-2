var User = require('../../models/user');

var UsersNewRoute = Ember.Route.extend({
  model: function() {
    return User.createRecord({ name: '', email: '' });
  }
});

module.exports = UsersNewRoute;

