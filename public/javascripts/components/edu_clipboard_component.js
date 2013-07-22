var ZeroClipboard = window.ZeroClipboard = require('../vendor/ZeroClipboard');

var EduClipboardComponent = Ember.Component.extend({
  didInsertElement: function () {
    var clip = new ZeroClipboard(this.$('button'), {
      moviePath: "/assets/ZeroClipboard.swf"
    });

    clip.on('noFlash', function (client) {
      console.log("Your browser has no Flash.");
    });

    clip.on('wrongFlash', function (client, args) {
      console.log("Flash 10.0.0+ is required but you are running Flash " + args.flashVersion.replace(/,/g, "."));
    });

    clip.on( 'complete', function(client, args) {
      App.FlashQueue.pushFlash('notice', 'Copied token to clipboard');
    });
  }
});

module.exports = EduClipboardComponent;