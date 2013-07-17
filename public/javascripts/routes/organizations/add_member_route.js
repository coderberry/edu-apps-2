var Organization = require('../../models/organization');

var OrganizationsAddMemberRoute = Ember.Route.extend({
  model: function(params) {
    return Organization.find(params.organization_id);
  }
});

module.exports = OrganizationsAddMemberRoute;

