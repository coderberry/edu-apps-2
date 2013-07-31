var AppsReviewsView = Ember.CollectionView.extend({
  tagName:           'ul',
  elementId:         'app-reviews',
  itemViewClass:     'App.AppsReviewView',

  didInsertElement: function() {
    console.log(this.get('content'));
    console.log("INSERTED UL");
  }
});

module.exports = AppsReviewsView;

