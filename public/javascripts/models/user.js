var User = DS.Model.extend({
  name:     DS.attr('string'),
  email:    DS.attr('string'),

  memberships: DS.hasMany('App.Membership'),

  errors: {}
});

User.reopenClass({ 
  url: 'user'
});

module.exports = User;

