# jekyll-expand

> [!NOTE]
> Head to [jekyll-expand.szonov.com](https://jekyll-expand.szonov.com/jekyll/update/2022/11/11/welcome-to-jekyll.html) to see a live demo of this plugin!

This repository hosts code for a [tag plugin](https://jekyllrb.com/docs/plugins/tags/) for Jekyll based websites. It allows you to hide long form content - this way, your website can be compact and the user is not overwhelmed with details until they are ready to deep dive.

The tag is used in your markdown post page as follow:

```
Markdown content before the tag...

{% expand %}

Markdown content within the tag! You can hide photos, code, text and more until the website user is ready to view them.  

{% endexpand %}

...Markdown content after the tag
```

There are optional arguments you can specify to customize your layout:

 - `button_text`: By default the button text is `Show more`. You can change to be more specific to your content like: `Click me to see this long piece of code` via `{% expand button_text:"Click me to see this long piece of code"%}`
 - `preview_height: By default the preview_height is `120px`. You can change to be more specific to your content like: `{% expand preview_height:"50"%}`

## How to use

### 1. Import the plugin

Copy the plugin folder `jekyll-expand` from this repository's `lib` directory into your site's `_plugin` folder.

### 2. Start using the plugin.

For example:

```
Markdown content before the tag...

{% expand %}

Markdown content within the tag! You can hide photos, code, text and more until the website user is ready to view them.  

{% endexpand %}

...Markdown content after the tag
```

