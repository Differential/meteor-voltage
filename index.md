---
layout: default
username: Differential
repo: meteor-voltage
version: 0.1.1
desc: Provides easy, editable, static pages. Editable in Markdown.

---
# Voltage

This Meteor package provides easy, editable, static pages. Perfect for your `About`,
`Terms Of Service`, and `Contact Us` pages. `voltage` is _not_ (currently) a CMS.
It's an easy way for a developer to maintain static pages, as opposed to an end
user. Somewhat inspired by the Rails
[high-voltage](https://github.com/thoughtbot/high_voltage) gem.

## Quick Start

```
mrt add voltage
mrt add iron-router
```

Add an `iron-router` route for your static page. The route must use the custom
action and subscription:

{% highlight coffeescript %}
Router.map ->
  @route 'aboutUs',
    path: '/about-us'
    waitOn: ->
      Meteor.subscribe 'voltagePages'
    action: ->
      Voltage.render @
{% endhighlight %}

Load the route in your browser. You should see a blank page within your site's
layout. If you log in (`Meteor.user()` returns a user), you should see an `Edit`
button for the page.

Repeat for any other static pages you need.

## Roles

By default, any logged-in user can edit Voltage pages. To ensure that only
select users can edit pages, specify an `adminRole` in Voltage config:

{% highlight coffeescript %}
if Meteor.isServer
  Voltage.config
    adminRole: 'admin'
{% endhighlight %}

Then, you need to give admin users that role. Currently, you're on your own
to add these roles somehow:

* Add these directly to admin users in the database (`"roles": ["admin"]`), or
* Roll your own admin page using the methods provided by [meteor-roles](https://atmosphere.meteor.com/package/roles), or
* Use an accounts admin package like [accounts-admin-ui-bootstrap-3](https://atmosphere.meteor.com/package/accounts-admin-ui-bootstrap-3).

## Example Project

There is an example project with instructions running at
[voltage-example.meteor.com](http://voltage-example.meteor.com). The example project is also on
[GitHub](https://github.com/BeDifferential/voltage-example).
