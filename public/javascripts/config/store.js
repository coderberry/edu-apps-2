var NestedRESTAdapter = require('./nested_rest_adapter');

module.exports = DS.Store.extend({
  adapter: NestedRESTAdapter.create({
    namespace: 'api/v1'
  })
});

