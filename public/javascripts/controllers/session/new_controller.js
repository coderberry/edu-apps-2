var SessionNewController = Ember.ObjectController.extend({

  attemptedTransition: null,

  loginUser: function() {
    var self = this;
    var data = this.getProperties('email', 'password');
    var attemptedTrans = this.get('attemptedTransition');

    $.post('/api/v1/session', data, function(results) {
      App.AuthManager.authenticate(results.api_key.access_token, results.api_key.user_id);
      App.FlashQueue.pushFlash('notice', 'Welcome back!');

      if (attemptedTrans) {
        attemptedTrans.retry();
        self.set('attemptedTransition', null);
      } else {
        self.transitionToRoute('index');
      }

    }).fail(function(jqxhr, textStatus, error ) {
      if (jqxhr.status === 401 || jqxhr.status === 404) {
        App.FlashQueue.pushFlash('error', 'Invalid email and/or password');
      }
    });;
  }
});

module.exports = SessionNewController;

