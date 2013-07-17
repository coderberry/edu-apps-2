var User = Ember.Model.extend({
  // attributes
  name:     Ember.attr(),
  email:    Ember.attr(),
  errors:   {},

  // associations
  memberships: Ember.hasMany('App.Membership', { key: 'membership_ids' })

}).reopenClass({
  rootKey:       'user',
  collectionKey: 'users',
  url:           '/api/v1/users',
  adapter:       Ember.RESTAdapter.create()
});

module.exports = User;

