var Organization = Ember.Model.extend({
  // attributes
  name: Ember.attr(),

  // associations
  memberships: Ember.hasMany('App.Membership', { key: 'membership_ids' })

}).reopenClass({
  rootKey:       'organization',
  collectionKey: 'organizations',
  url:           '/api/v1/organizations',
  adapter:       Ember.RESTAdapter.create()
});

module.exports = Organization;

