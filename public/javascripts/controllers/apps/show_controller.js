var AppsShowController = Ember.ObjectController.extend({
  needs: ['preview'],

  preview: function(lti_app) {
    var previewController = this.get('controllers.preview');
    previewController.set('model', lti_app);
    Ember.$('#preview-modal').modal();
    Ember.$('#preview-model').on('hidden', function () {
      previewController.set('model', null);
    });
  }
});

module.exports = AppsShowController;

