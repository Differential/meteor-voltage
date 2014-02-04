################################################################################
# Client-side Config
#


Voltage =
  settings:
    defaultTemplate: 'voltagePage'

  config: (appConfig) ->
    @settings = _.extend(@settings, appConfig)

  render: (router) ->
    router.render 'voltageBlank'
    router.render 'voltagePage'

@Voltage = Voltage


################################################################################
# Bootstrap Code
#

Meteor.subscribe 'voltagePages'

Meteor.startup ->
  $('<link>',
    href: '//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'
    rel: 'stylesheet'
  ).appendTo 'head'

################################################################################
# Register Global Helpers
#

Handlebars.registerHelper "voltageEditor", ->
  if Meteor.user()
    return new Handlebars.SafeString '<div id="voltage-editor-btns"></div>'

Handlebars.registerHelper "voltagePage", ->
  new Handlebars.SafeString Template.voltagePage(this)
