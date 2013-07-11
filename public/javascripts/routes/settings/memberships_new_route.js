var MembershipOrganizationForm = require("../../components/membership_organization_form");

var SettingsMembershipsNewRoute = Ember.Route.extend({
  model: function() {
    return new MembershipOrganizationForm;
  }
});

module.exports = SettingsMembershipsNewRoute;

