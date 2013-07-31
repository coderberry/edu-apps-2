var StarRatingComponent = Ember.Component.extend({
  starClass: function() {
    return 'star-sprite-' + this.get('stars');
  }.property('stars')
});

module.exports = StarRatingComponent;

