Meteor.startup ->

  ##############################################################################
  # Migrations and such
  #

  Page._collection._ensureIndex 'name': 1

  ##############################################################################
  # Server-side config
  #

  Voltage =
    settings:
      adminRole: null
      adminGroup: null

    config: (appConfig) ->
      @settings = _.extend(@settings, appConfig)

  @Voltage = Voltage

  ##############################################################################
  # Server-side methods
  #

  Meteor.methods
    isVoltageAuthorized: () ->
      if not Meteor.user()
        return false

      if Voltage.settings.adminRole and not Roles.userIsInRole(Meteor.user(), Voltage.settings.adminRole, Voltage.settings.adminGroup)
        return false

      true
