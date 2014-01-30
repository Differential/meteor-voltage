Meteor.publish 'singlePage', (slug) ->
  Page.find slug: slug
