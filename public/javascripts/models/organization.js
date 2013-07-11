var Organization = DS.Model.extend({
  name: DS.attr('string'),

  memberships: DS.hasMany('App.Membership', { embedded: 'always' })
});

module.exports = Organization;

