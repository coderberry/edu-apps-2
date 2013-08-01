var StarWrapperComponent = Ember.Component.extend({
  tagName: 'span',
  classNames: 'stars',

  didInsertElement: function() {
    val = this.get('stars');
    console.log("VAL: ", val);
    size = 0;
    if (val) {
      // Make sure that the value is in 0 - 5 range, multiply to get width
      size = Math.max(0, (Math.min(5, val))) * 16;
    }

    // Create stars holder
    var $span = $('<span/>').width(size);
    
    // this.$().html($span);
    this.$().html($span);
  }.observes('stars')
});

module.exports = StarWrapperComponent;
