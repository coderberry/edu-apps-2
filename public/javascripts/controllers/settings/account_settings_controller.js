var SettingsAccountSettingsController = Ember.ObjectController.extend({

  save: function() {
    var self = this;
    form = this.get('model');

    var data = form.getProperties('existing_password', 'password', 'password_confirmation');

    var request = $.ajax({
      type: 'PUT',
      url: '/api/v1/users/update_password',
      data: data
    });

    request.done(function( msg ) {
      App.FlashQueue.pushFlash('notice', 'Saved');
      form.reset();
    });

    request.fail(function(jqxhr, textStatus) {
      switch(jqxhr.status) {
        case 401:
          form.set('errors', Ember.Object.create({ existing_password: 'is not correct' }));
          break;

        case 422:
          var msg = JSON.parse(jqxhr.responseText);
          var errors = msg.errors;
          form.set('errors', Ember.Object.create(errors));
          break;

        default:
          App.FlashQueue.pushFlash('error', 'Unexpected response from server');
      }
    });
  }

});

module.exports = SettingsAccountSettingsController;

