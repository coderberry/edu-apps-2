var LtiApp = require('../../models/lti_app');
// var Review = require('../../models/review');

var AppsShowRoute = Ember.Route.extend({
  model: function(params) {
    return LtiApp.find(params.app_id);
  },

  // setupController: function(controller, model) {
  //   this._super(controller, model);
  //   var ltiAppId = model.get('short_name');
  //   if (Ember.isEmpty(ltiAppId)) {
  //     ltiAppId = model.get('id');
  //   }
  //   this.set('reviews', Review.find({ lti_app_id: ltiAppId }));
  // },

  serialize: function(model, params) {
    return { app_id: model.get('short_name') };
  }
});

module.exports = AppsShowRoute;

