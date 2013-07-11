var NestedRESTAdapter = DS.RESTAdapter.extend({
  rootForType: function(type) {
    var url = Ember.get(type, 'url');
    if (Ember.isEmpty(url)) {
      url = this._super(type);
    }
    debugger;
    return url;
  }
});

module.exports = NestedRESTAdapter;