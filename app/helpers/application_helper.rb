module ApplicationHelper
  include SessionsHelper

  def markdown(text)
    options = {
      hard_wrap: true,
      link_attributes: { rel: 'nofollow', target: '_blank' },
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      quote: true
    }
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    sanitize(markdown.render(text))
  end
end
