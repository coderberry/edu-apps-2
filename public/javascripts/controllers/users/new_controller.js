var UsersNewController = Ember.ObjectController.extend({
  
  createUser: function() {
    var router = this.get('target');
    var user = this.get('model');
    var data = { user: user.getProperties('name', 'email', 'password', 'password_confirmation') }

    $.post('/api/v1/users', data, function(results) {
      App.AuthManager.authenticate(results.api_key.access_token, results.api_key.user_id);
      router.transitionTo('index');

    }).fail(function(jqxhr, textStatus, error ) {
      if (jqxhr.status === 422) {
        errs = JSON.parse(jqxhr.responseText)
        user.set('errors', errs.errors);
      }
    });
  }

});

module.exports = UsersNewController;

