class Admin::SearchController < ApplicationController
  def index
    if params[:q]
      @pages = Page.search(params[:q]).uniq
      if current_user.designer? || current_user.admin?
        @snippets = Snippet.search(params[:q]).uniq
        @layouts = Layout.search(params[:q]).uniq
        @templates = Template.search(params[:q]).uniq if defined?(TemplatesExtension)
        @banners = Banner.search(params[:q]).uniq if defined?(BannerRotatorExtension)
      end
    end
  end
end
