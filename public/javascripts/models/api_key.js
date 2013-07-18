var ApiKey = Ember.Model.extend({
  access_token: Ember.attr(),
  user:         null // We don't need to load the relationship

}).reopenClass({
  rootKey:       'api_key',
  collectionKey: 'api_keys',
  url:           '/api/v1/api_keys',
  adapter:       Ember.RESTAdapter.create()
});

module.exports = ApiKey;
