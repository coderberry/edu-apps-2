var Membership = require("../../models/membership");
var AuthenticatedRoute = require('../authenticated_route');

var SettingsMembershipRoute = AuthenticatedRoute.extend({
  model: function(params) {
    return Membership.find(params.membership_id);
  }
});

module.exports = SettingsMembershipRoute;

