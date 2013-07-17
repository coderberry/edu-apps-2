var Membership = Ember.Model.extend({
  // attributes
  is_admin:     Ember.attr(),

  // associations
  user:         Ember.belongsTo('App.User', { key: 'user_id' }),
  organization: Ember.belongsTo('App.Organization', { key: 'organization_id' })

}).reopenClass({
  rootKey:       'membership',
  collectionKey: 'memberships',
  url:           '/api/v1/memberships',
  adapter:       Ember.RESTAdapter.create()
});

module.exports = Membership;

