var MembershipOrganizationForm = Ember.Object.extend({ 
  name: '',
  errors: {},

  reset: function() {
    this.set('name', '');
    this.set('errors', {});
  }
});

module.exports = MembershipOrganizationForm;