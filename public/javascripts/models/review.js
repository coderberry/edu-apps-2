var moment = require('../vendor/moment.min');

var Review = Ember.Model.extend({
  // attributes
  id:         Ember.attr(),
  rating:     Ember.attr(Number),
  comments:   Ember.attr(),
  created_at: Ember.attr(Date),
  user:       Ember.attr(), // Not association.. just load data

  // reviewed_on: function() {
  //   return moment(this.get('created_at')).format('MMMM Do YYYY, h:mm:ss a');
  // }.property('created_at')

}).reopenClass({
  rootKey:       'review',
  collectionKey: 'reviews',
  url:           '/api/v1/reviews',
  adapter:       Ember.RESTAdapter.create()
});

module.exports = Review;

