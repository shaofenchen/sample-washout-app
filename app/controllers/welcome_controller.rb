class WelcomeController < ApplicationController
  def index
    @readme = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @readme = @readme.render File.read(Rails.root + 'README.md')
  end
end
