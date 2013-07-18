var Membership = require("./membership");
var ApiKey = require("./api_key");

var Organization = Ember.Model.extend({
  // attributes
  name: Ember.attr(),
  access_token: Ember.attr(),

  // associations
  memberships: Ember.hasMany('App.Membership', { key: 'membership_ids' }),

  currentMembership: function() {
    // FIX ME!!!
    // var userId = App.AuthManager.get('apiKey.user.id');
    // this.get('memberships').forEach(function(membership) {
    //   membership.reload();
    //   console.log(membership.user.id + ' === ' + userId);
    //   if (membership.user.id === userId) {
    //     return membership;
    //   }
    // });
  }.property()

}).reopenClass({
  rootKey:       'organization',
  collectionKey: 'organizations',
  url:           '/api/v1/organizations',
  adapter:       Ember.RESTAdapter.create()
});

module.exports = Organization;
