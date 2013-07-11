var ToggleSwitchView = Ember.View.extend({
  classNames: ['toggle-switch'],
  templateName: 'toggle_switch',
  
  init: function() {
    this._super.apply(this, arguments);
    return this.on('change', this, this._updateElementValue);
  },
  
  checkBoxId: (function() {
    return "checker-" + (this.get('elementId'));
  }).property(),
  
  _updateElementValue: function() {
    return this.set('checked', this.$('input').prop('checked'));
  }
});

module.exports = ToggleSwitchView;

