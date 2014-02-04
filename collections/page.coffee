class @Page extends Minimongoid

  @_collection: new Meteor.Collection 'voltage_pages'

Page._collection.allow
  insert: (userId, item) ->
    Meteor.call 'isVoltageAuthorized'

  update: (userId, item, fields) ->
    Meteor.call 'isVoltageAuthorized'

  remove: (userId, item) ->
    Meteor.call 'isVoltageAuthorized'
