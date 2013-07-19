var ZeroClipboard = window.ZeroClipboard = require('../vendor/ZeroClipboard');

Ember.Handlebars.helper('zeroClipboard', Ember.View.extend({
  tagName: 'button',
  classNames: ['btn'],
  attributeBindings: ['title', 'data-clipboard-text'],
  title: 'Copy to clipboard',

  didInsertElement: function() {
    var clip = window.CLIP = new ZeroClipboard(this.$(), {
      moviePath: "/assets/ZeroClipboard.swf"
    } );

    // clip.on('load', function(client) {
    //   console.log('loaded');
    // });

    clip.on('noFlash', function (client) {
      console.log("Your browser has no Flash.");
    });

    clip.on('wrongFlash', function (client, args) {
      console.log("Flash 10.0.0+ is required but you are running Flash " + args.flashVersion.replace(/,/g, "."));
    });

    clip.on( 'complete', function(client, args) {
      App.FlashQueue.pushFlash('notice', 'Copied token to clipboard');
    } );

    // clip.on( 'mouseover', function(client) {
    //   console.log("mouse over");
    // } );

    // clip.on( 'mouseout', function(client) {
    //   console.log("mouse out");
    // } );

    // clip.on( 'mousedown', function(client) {
    //   console.log("mouse down");
    // } );

    // clip.on( 'mouseup', function(client) {
    //   console.log("mouse up");
    // } );
  }
}));

