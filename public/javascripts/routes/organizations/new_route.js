var Organization = require("../../models/organization");

var OrganizationsNewRoute = Ember.Route.extend({
  model: function() {
    return Organization.create();
  }
});

module.exports = OrganizationsNewRoute;

