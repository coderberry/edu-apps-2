var TutorialsRoute = Ember.Route.extend({
  redirect: function() {
    this.transitionTo('tutorials.canvas');
  }
});

module.exports = TutorialsRoute;

