var AuthenticatedRoute = require('../authenticated_route');
var Organization = require('../../models/organization');

var OrganizationsIndexRoute = AuthenticatedRoute.extend({
  model: function() {
    return Organization.fetch();
  }
});

module.exports = OrganizationsIndexRoute;

