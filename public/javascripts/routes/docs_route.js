var DocsRoute = Ember.Route.extend({
  redirect: function() {
    this.transitionTo('basics.index');
  }
});

module.exports = DocsRoute;

