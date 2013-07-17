var Membership = require("../../models/membership");
var Organization = require("../../models/organization");

var SettingsMembershipsNewController = Ember.ObjectController.extend({
  needs: ["settingsMemberships"],
  
  save: function() {
    var self = this;
    organization = this.get('model');
    organization.save().then(
      function(object) {
        var membership = organization.get('memberships.firstObject');
        self.get("controllers.settingsMemberships").pushObject(membership);
        App.FlashQueue.pushFlash('notice', 'Organization has been created successfully!');
        self.transitionToRoute('settings.memberships');
      },
      function(error) {
        App.FlashQueue.pushFlash('error', 'Please try again');
      }
    );
  }

});

module.exports = SettingsMembershipsNewController;

