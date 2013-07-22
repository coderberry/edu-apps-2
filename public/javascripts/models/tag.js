var Tag = Ember.Model.extend({
  id:         Ember.attr(),
  name:       Ember.attr(),
  short_name: Ember.attr(),
  context:    Ember.attr()

}).reopenClass({
  rootKey:       'tag',
  collectionKey: 'tags',
  url:           '/api/v1/tags',
  adapter:       Ember.RESTAdapter.create()
});

module.exports = Tag;

