################################################################################
# Client-side Config
#


Voltage =
  settings:
    defaultTemplate: 'voltagePage'

  config: (appConfig) ->
    @settings = _.extend(@settings, appConfig)

  render: (router) ->
    if router.ready()
      Meteor.setTimeout ->
        router.render 'voltagePage'
      , 0

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

UI.registerHelper "voltagePage", ->
  new Spacebars.SafeString Template.voltagePage(this)
