require "markdown_handler"

ActionView::Template.register_template_handler :md, MarkdownHandler
ActionView::Template.register_template_handler :markdown, MarkdownHandler