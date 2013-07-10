var AuthManager = require('../config/auth_manager');

var ApplicationRoute = Ember.Route.extend({
  init: function() {
    this._super();
    App.AuthManager = AuthManager.create();
  },

  events: {
    logout: function() {
      App.AuthManager.reset();
      App.FlashQueue.pushFlash('notice', 'You are now logged out');
      this.transitionTo('session.new');
    }
  }
});

module.exports = ApplicationRoute;
