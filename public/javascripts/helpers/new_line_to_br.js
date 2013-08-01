Ember.Handlebars.helper('newLineToBr', function(value) {
  if (Ember.isEmpty(value)) {
    return '';
  } else {
    return value.replace(/\r?\n|\r/g, '<br>');
  }
});

