---
layout: default
username: BeDifferential
repo: meteor-voltage
version: 0.1.0
desc: Provides easy, editable, static pages. Editable in Markdown.

---
# Meteor Voltage

This is a meteorite package that gives you a basic, out-of-the-box blog at
`/blog`.  We wanted something to work with that uses Iron Router, Bootstrap 3,
and didn't require us to run another dyno for a meteor-based blog.

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
