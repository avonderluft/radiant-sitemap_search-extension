class Admin::SearchController < ApplicationController
  def index
    if params[:q]
      @pages = Page.search(params[:q])
      if current_user.designer? || current_user.admin?
        @snippets = Snippet.search(params[:q])
        @layouts = Layout.search(params[:q])
        @templates = Template.search(params[:q]) if defined?(TemplatesExtension)
        @banners = Banner.search(params[:q]) if defined?(BannerRotatorExtension)
      end
    end
  end
end
