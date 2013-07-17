var OrganizationsIndexController = Ember.ArrayController.extend({
  deleteMembership: function(membership) {
    if (!confirm("Are you sure?")) return;

    membership.deleteRecord();
    App.FlashQueue.pushFlash('notice', 'You have been successfully removed from the organization.');  
  }
});

module.exports = OrganizationsIndexController;

