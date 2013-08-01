var moment = require('../vendor/moment.min');

var Review = Ember.Model.extend({
  id:          Ember.attr(),
  rating:      Ember.attr(Number),
  comments:    Ember.attr(),
  created_at:  Ember.attr(Date),
  reviewed_on: Ember.attr(), // Formatted created_at
  user:        Ember.attr(), // Not association.. just load data

}).reopenClass({
  rootKey:       'review',
  collectionKey: 'reviews',
  url:           '/api/v1/reviews',
  adapter:       Ember.RESTAdapter.create()
});

module.exports = Review;

