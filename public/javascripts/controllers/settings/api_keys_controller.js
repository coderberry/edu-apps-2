var ApiKey = require('../../models/api_key');

var SettingsApiKeysController = Ember.ArrayController.extend({
  addToken: function() {
    var apiKey = ApiKey.create();
    apiKey.save();
    this.get('model').reload();
  },

  deleteToken: function(apiKey) {
    apiKey.deleteRecord();
    this.get('model').reload();
  }
});

module.exports = SettingsApiKeysController;

