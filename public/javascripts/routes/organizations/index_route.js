var Organization = require('../../models/organization');

var OrganizationsIndexRoute = Ember.Route.extend({
  model: function() {
    return Organization.fetch();
  }
});

module.exports = OrganizationsIndexRoute;

