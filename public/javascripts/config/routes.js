var App = require('./app');

App.Router.map(function() {
  this.resource('apps', function() {
    this.route('show', { path: '/:app_id' });
  });
  this.resource('tutorials', function() {
    this.route('canvas');
    this.route('moodle');
    this.route('blackboard');
    this.route('desire2learn');
    this.route('sakai');
  });
  this.resource('session', function() {
    this.route('new');
  });
  this.resource('docs', function() {
    this.resource('basics', function() {
      this.route('index');
      this.route('building_an_lti_app');
      this.route('post_parameters');
      this.route('other_resources');
    });
    this.resource('extensions', function() {
      this.route('index');
      this.route('content');
      this.route('result_data');
      this.route('canvas_navigation');
      this.route('canvas_wysiwyg');
      this.route('canvas_link_selection');
      this.route('canvas_homework');
    });
    this.resource('api', function() {
      this.route('index');
      this.route('app_details');
      this.route('app_reviews');
      this.route('apps_list');
      this.route('contributing_reviews');
      this.route('retrieving_a_review');
    });
  });
  this.resource('users', function() {
    this.route('new');
    this.route('show');
  });
  this.resource('settings', function() {
    this.route('profile');
    this.route('account_settings');
    this.route('memberships', { path: '/organizations' });
    this.route('memberships_new', { path: '/organizations/new' });
    this.route('membership', { path: '/organizations/:membership_id' })
  })
});

