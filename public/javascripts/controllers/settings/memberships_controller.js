var SettingsMembershipsController = Ember.ArrayController.extend({

  deleteMembership: function(membership) {
    if (!confirm("Are you sure you want to leave " + membership.get("organization.name") + "?")) return;

    membership.deleteRecord();
    this.get('store').commit();
    App.FlashQueue.pushFlash('notice', 'You have been successfully removed from the organization.');  
  }

});

module.exports = SettingsMembershipsController;

