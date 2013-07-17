var Organization = require('../../models/organization');

var OrganizationsShowRoute = Ember.Route.extend({
  model: function(params) {
    return Organization.find(params.organization_id);
  }
});

module.exports = OrganizationsShowRoute;

