Template.voltagePage.created = ->
  Meteor.call 'isVoltageAuthorized', (err, authorized) ->
    Session.set 'isVoltageAuthorized', authorized


Template.voltagePage.helpers
  isVoltageAuthorized: ->
    Session.get 'isVoltageAuthorized'


Template.voltagePage.rendered = ->
  slug = window.location.pathname.replace(/\//g, '-').slice(1)

  $('.voltage').addClass slug

  new Voltage.Editor
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
