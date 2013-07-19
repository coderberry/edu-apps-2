var ApiKey = require('../../models/api_key');

var OrganizationsShowController = Ember.ObjectController.extend({

  regenerateToken: function() {
    $.post('/api/v1/api_keys', { organization_id: this.get('model.id') }, function(data) {
      this.get('model').reload();
    }.bind(this))
  },

  addMember: function() {
    var data = {
      email: this.get('newEmail') || '',
      is_admin: this.get('newIsAdmin') === true
    }

    if (data.email.length > 0) {
      var request = $.ajax({
        type: 'POST',
        url: '/api/v1/organizations/' + this.get('id') + '/add_member',
        data: data
      });

      request.done(function( msg ) {
        self.set('newEmail', null);
        self.set('newIsAdmin', false);

        App.FlashQueue.pushFlash('notice', 'Added ' + data.email + ' successfully');
        self.get('model').reload();
      }.bind(this));

      request.fail(function(jqxhr) {
        switch(jqxhr.status) {
          case 401:
            App.FlashQueue.pushFlash('error', 'You do not have permission to do this');
            break;

          case 404:
            App.FlashQueue.pushFlash('warning', 'You do not have access to this organization');
            break;

          case 422:
            var msg = JSON.parse(jqxhr.responseText);
            App.FlashQueue.pushFlash('warning', msg.message);
            break;

          default:
            App.FlashQueue.pushFlash('error', 'Unexpected response from server');
        }
      });

    }
  },

  removeMembership: function(membership) {
    var name = membership.get('user.name');
    if (!confirm("Are you sure you want to remove " + name + "?")) return;

    membership.deleteRecord().then(
      function(results) {
        // console.log("FOOOOO", this);
        App.FlashQueue.pushFlash('notice', 'You have successfully removed ' + name + ' from the organization.');
        self.get('model').reload(); // self.transitionToRoute('organizations.show', self);
      }.bind(this)
    );
  }
});

module.exports = OrganizationsShowController;

