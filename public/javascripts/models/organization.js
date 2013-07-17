var Membership = require("./membership");

var Organization = Ember.Model.extend({
  // attributes
  name: Ember.attr(),

  // associations
  memberships: Ember.hasMany('App.Membership', { key: 'membership_ids' }),

  currentMembership: function() {
    return Membership.fetch({ user_id: App.AuthManager.get('apiKey.user.id'), organization_id: this.get('id'), limit: 1 }).then(
      function(results) {
        return results.get('firstObject');
      }
    );
  }.property()

}).reopenClass({
  rootKey:       'organization',
  collectionKey: 'organizations',
  url:           '/api/v1/organizations',
  adapter:       Ember.RESTAdapter.create()
});

module.exports = Organization;
