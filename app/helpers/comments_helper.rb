module CommentsHelper
  def parse_at_mentions(comment_body)
    comment_body.gsub(/@([a-zA-Z0-9_]+)/) do |match|
      user = User.find_by(name: Regexp.last_match(1))
      if user
        view_context.link_to(match, user_path(user))
      else
        match
      end
    end
  end
end
