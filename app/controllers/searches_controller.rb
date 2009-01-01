class SearchesController < ApplicationController
  def index
    @pages = Page.search(params[:q])
    @snippets = Snippet.search(params[:q])
  end
end
