editor = new Voltage.Editor

Deps.autorun ->
  if Meteor.user()
    Meteor.call 'isVoltageAuthorized', (err, authorized) ->
      Session.set 'isVoltageAuthorized', authorized
  else
    Session.set 'isVoltageAuthorized', false


Template.voltagePage.helpers
  isVoltageAuthorized: ->
    editor.renderData()
    Session.get 'isVoltageAuthorized'


Template.voltagePage.rendered = ->
  slug = window.location.pathname.replace(/\//g, '-').slice(1)

  $('.voltage').addClass slug

  options =
    update: (markdown) =>
      page = Page.first name: slug

      if page
        page.update text: markdown
      else
        Page.create
          text: markdown
          name: slug
    html: () =>
      page = Page.first name: slug

      if page
        return marked page.text

      ''
    markdown: () =>
      page = Page.first name: slug

      if page
        return page.text

      ''

  editor.init(options).renderData()


Template.voltageEditor.rendered = ->
  editor.renderEditor()
