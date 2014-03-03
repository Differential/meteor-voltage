Package.describe({
  summary: "A package that provides easy, editable, static pages"
});

Package.on_use(function(api) {

  var both = ['client', 'server'];

  /**
   * Packages for client
   */

  api.use([
    'templating',
    'handlebars',
    'less',
    'deps',
    'session',
    'ace-embed'
  ], 'client');

  /**
   * Files for client
   */

  api.add_files([
    'client/boot.coffee',
    'client/compatibility/voltage.editor.js',
    'client/views/voltagePage.less',
    'client/views/voltagePage.html',
    'client/views/voltagePage.coffee'
  ], 'client');

  /**
   * Files for server
   */

  api.add_files([
    'server/boot.coffee',
    'server/publications.coffee'
  ], 'server');

  /**
   * Packages for server and client
   */

  api.use([
    'coffeescript',
    'accounts-base',
    'minimongoid',
    'roles',
    'marked'
  ], both);

  /**
   * Files for server and client
   */

  api.add_files([
    'collections/page.coffee'
  ], both);
});

