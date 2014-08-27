Package.describe({
  summary: "A package that provides easy, editable, static pages",
  version: "0.2.0",
  name: "hellogerard:voltage",
  git: "https://github.com/Differential/meteor-voltage.git"
});

Package.onUse(function(api) {
  api.versionsFrom("METEOR@0.9.0");

  var both = ['client', 'server'];

  /**
   * Packages for client
   */

  api.use([
    'templating',
    'ui',
    'less',
    'deps',
    'session',
    'mrt:ace-embed'
  ], 'client');

  /**
   * Files for client
   */

  api.addFiles([
    'client/boot.coffee',
    'client/compatibility/voltage.editor.js',
    'client/views/voltagePage.less',
    'client/views/voltagePage.html',
    'client/views/voltagePage.coffee'
  ], 'client');

  /**
   * Files for server
   */

  api.addFiles([
    'server/boot.coffee',
    'server/publications.coffee'
  ], 'server');

  /**
   * Packages for server and client
   */

  api.use([
    'coffeescript',
    'accounts-base',
    'mrt:minimongoid',
    'alanning:roles',
    'chuangbo:marked'
  ], both);

  /**
   * Files for server and client
   */

  api.addFiles([
    'collections/page.coffee'
  ], both);
});

