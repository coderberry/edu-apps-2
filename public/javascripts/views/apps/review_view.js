var AppsReviewView = Ember.View.extend({
  tagName: 'li',
  classNames: ['app-review', 'media'],
  layoutName: 'apps/review',
  
  didInsertElement: function() {
    console.log("Inserted item");
  }
});

module.exports = AppsReviewView;
