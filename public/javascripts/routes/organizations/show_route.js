var AuthenticatedRoute = require('../authenticated_route');
var Organization = require('../../models/organization');

var OrganizationsShowRoute = AuthenticatedRoute.extend({
  model: function(params) {
    if (params.organization_id === 'undefined') {
      this.transitionTo('organizations.index');
    } else {
      return Organization.find(params.organization_id);
    }
  }
});

module.exports = OrganizationsShowRoute;

