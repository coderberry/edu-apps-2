var AuthenticatedRoute = require('../authenticated_route');
var Organization = require("../../models/organization");

var OrganizationsNewRoute = AuthenticatedRoute.extend({
  model: function() {
    return Organization.create();
  }
});

module.exports = OrganizationsNewRoute;

