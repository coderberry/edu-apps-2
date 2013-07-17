var Organization = require("../../models/organization");

var SettingsMembershipsNewRoute = Ember.Route.extend({
  model: function() {
    return Organization.create();
  }
});

module.exports = SettingsMembershipsNewRoute;

