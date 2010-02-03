class SearchesController < ApplicationController
  def index
    @pages = Page.search(params[:q])
    @snippets = Snippet.search(params[:q])
    @banners = Banner.search(params[:q]) if defined?(BannerRotator)
  end
end
