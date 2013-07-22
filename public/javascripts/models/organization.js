var Membership = require("./membership");
var ApiKey = require("./api_key");

var Organization = Ember.Model.extend({
  // attributes
  name: Ember.attr(),
  access_token: Ember.attr(),
  currentMembership: null,

  // associations
  memberships: Ember.hasMany('App.Membership', { key: 'membership_ids' }),

  loadMemberships: function() {
    var userId = App.AuthManager.get('apiKey.user.id');
    this.get('memberships').forEach(function(membership) {
      membership.reload();
      membership.on('didLoad', function(obj) {
        // debugger;
        if (membership.get('user.id') === userId) {
          this.set('currentMembership', membership);
        }
      }.bind(this));
    }.bind(this));
  }.observes('memberships.@each')

}).reopenClass({
  rootKey:       'organization',
  collectionKey: 'organizations',
  url:           '/api/v1/organizations',
  adapter:       Ember.RESTAdapter.create()
});

module.exports = Organization;
