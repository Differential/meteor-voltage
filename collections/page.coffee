class @Page extends Minimongoid

  @_collection: new Meteor.Collection 'voltage_pages'

Page._collection.allow
  insert: (userId, item) ->
    Meteor.call 'isAuthorized'

  update: (userId, item, fields) ->
    Meteor.call 'isAuthorized'

  remove: (userId, item) ->
    Meteor.call 'isAuthorized'
