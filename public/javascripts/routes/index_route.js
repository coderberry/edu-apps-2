var IndexRoute = Ember.Route.extend({
  redirect: function() {
    this.transitionTo('apps.index');
  }
});

module.exports = IndexRoute;

