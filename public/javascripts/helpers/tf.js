Ember.Handlebars.helper('tf', function(val) {
  if (val === true) {
    return 'Yes';
  } else {
    return 'No';
  }
});
