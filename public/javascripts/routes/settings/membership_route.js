var Organization = require("../../models/organization");
var AuthenticatedRoute = require('../authenticated_route');

var SettingsMembershipRoute = AuthenticatedRoute.extend({
  model: function(params) {
    console.log("HELLO");
    return Membership.find({ organization_id: params.organization_id });
  },

  setupController: function(controller, model) {
    // controller.set('memberships')
    // controller.set('organization', model.get('organization'));
    // controller.set('organizationMembers', Membership.find({ organization_id: model.get('organization_id')}));
  }
});

module.exports = SettingsMembershipRoute;

