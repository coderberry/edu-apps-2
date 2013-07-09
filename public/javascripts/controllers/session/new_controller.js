var SessionNewController = Ember.ObjectController.extend({
  loginUser: function() {
    var self = this;
    var data = this.getProperties('email', 'password');

    $.post('/api/v1/session', data, function(results) {
      App.AuthManager.authenticate(results.api_key.access_token, results.api_key.user_id);
      self.transitionToRoute('index');
    });
  }
});

module.exports = SessionNewController;

