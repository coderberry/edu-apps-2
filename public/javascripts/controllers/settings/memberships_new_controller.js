var SettingsMembershipsNewController = Ember.ObjectController.extend({
  
  save: function() {
    var self = this;
    form = this.get('model');

    var data = form.getProperties('name');

    var request = $.ajax({
      type: 'POST',
      url: '/api/v1/memberships/create_organization',
      data: data
    });

    request.done(function( msg ) {
      App.FlashQueue.pushFlash('notice', 'Organization has been created successfully!');
      form.reset();
      self.transitionToRoute('settings.memberships');
    });

    request.fail(function(jqXHR, textStatus) {
      errors = JSON.parse(jqXHR.responseText);
      form.set('errors', Ember.Object.create(errors));
    });
  }

});

module.exports = SettingsMembershipsNewController;

