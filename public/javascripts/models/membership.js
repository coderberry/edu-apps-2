var Membership = DS.Model.extend({
  is_admin:     DS.attr('boolean'),
  user:         DS.belongsTo('App.User'),
  organization: DS.belongsTo('App.Organization')
});

Membership.reopenClass({
  url: function() {
    debugger;
    return 'memberships';
  }.property()
});

module.exports = Membership;

