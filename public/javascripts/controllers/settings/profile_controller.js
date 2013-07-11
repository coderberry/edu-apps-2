var SettingsProfileController = Ember.ObjectController.extend({
  save: function() {
    var self = this;
    var user = this.get('model');

    user.set('name', this.get('name'));

    user.save().then(
      function(data) { // Success
        App.FlashQueue.pushFlash('notice', 'Saved');
      }, 
      
      function(jqXHR, textStatus, errorThrown) { // Error
        errors = JSON.parse(jqXHR.responseText);
        user.set('errors', Ember.Object.create(errors.errors));
      }
    );
  }
});

module.exports = SettingsProfileController;

