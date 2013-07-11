var Membership = require("../../models/membership");
var AuthenticatedRoute = require('../authenticated_route');

var SettingsMembershipsRoute = AuthenticatedRoute.extend({
  model: function() {
    return Membership.find();
  }
});

module.exports = SettingsMembershipsRoute;

