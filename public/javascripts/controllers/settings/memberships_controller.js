var SettingsMembershipsController = Ember.ArrayController.extend({

  deleteMembership: function(membership) {
    if (!confirm("Are you sure you want to leave " + membership.get("organization.name") + "?")) return;

    membership.deleteRecord();
    App.FlashQueue.pushFlash('notice', 'You have been successfully removed from the organization.');  
  }

});

module.exports = SettingsMembershipsController;

