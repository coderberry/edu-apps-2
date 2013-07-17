var OrganizationsShowController = Ember.ObjectController.extend({
  removeMembership: function(membership) {
    var self = this;
    var name = membership.get('user.name');
    if (!confirm("Are you sure you want to remove " + name + "?")) return;

    membership.deleteRecord().then(
      function(results) {
        console.log("FOOOOO", this);
        App.FlashQueue.pushFlash('notice', 'You have successfully removed ' + name + ' from the organization.');
        self.transitionToRoute('organizations.show', self);
      }
    );
  }
});

module.exports = OrganizationsShowController;

