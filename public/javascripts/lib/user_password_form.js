var UserPasswordForm = Ember.Object.extend({ 
  existing_password: '',
  password: '',
  password_confirmation: '',
  errors: {},

  reset: function() {
    this.set('existing_password', '');
    this.set('password', '');
    this.set('password_confirmation', '');
    this.set('errors', {});
  }
});

module.exports = UserPasswordForm;