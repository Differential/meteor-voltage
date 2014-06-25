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
        return page.html || marked page.text

      ''
    markdown: () =>
      page = Page.first name: slug

      if page
        return page.text

      ''

  editor.init(options).renderData()

  # anchor fragment support
  hash = document.location.hash.substr(1)
  if hash && !Template.voltagePage.scrolled
    scroller = ->
      $("html, body").stop()

    Meteor.setTimeout(->
      elem = $('#' + hash)
      if elem.length
        scroller().scrollTop(elem.offset().top)
        Template.voltagePage.scrolled = true
    , 0)
    
Template.voltagePage.destroyed = ->
  delete Template.voltagePage.scrolled

Template.voltageEditor.rendered = ->
  editor.renderEditor()
