---
layout: default
username: BeDifferential
repo: meteor-voltage
version: 0.0.3
desc: Provides easy, editable, static pages. Editable in Markdown.

---
# Meteor Voltage

This package provides easy, editable, static pages. Perfect for your `About`,
`Terms Of Service`, and `Contact Us` pages. `voltage` is not (currently) a CMS.
It's an easy way for a developer to maintain static pages, as opposed to an end
user. Somewhat inspired by the Rails
[high-voltage](https://github.com/thoughtbot/high_voltage) gem.

## Quick Start

```
mrt add voltage
```

Add a route for your static page. The route MUST set the `template` to
`voltagePage`:

{% highlight coffeescript %}
Router.map ->
  @route 'aboutUs',
    path: '/about-us'
    template: 'voltagePage'
{% endhighlight %}

Load the route in your browser. You should see a blank page within your site's
layout. If you log in (`Meteor.user()` returns a user), you should see an `Edit`
button for the page.

Repeat for any other static pages you need.
