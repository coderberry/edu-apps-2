var ZeroClipboard = window.ZeroClipboard = require('../vendor/ZeroClipboard');

var EduClipboardComponent = Ember.Component.extend({

  message: "Copied token to clipboard",

  spanClass: function() {
    if (Ember.isEmpty(this.get('spanx'))) {
      return 'span4';
    } else {
      return 'span' + this.get('spanx');
    }
  }.property('spanx'),

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
      App.FlashQueue.pushFlash('notice', this.get('message'));
    }.bind(this));
  }
});

module.exports = EduClipboardComponent;