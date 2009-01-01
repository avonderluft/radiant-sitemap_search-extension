# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class SitemapSearchExtension < Radiant::Extension
  version "1.0"
  description "Adds a simple search feature to pages and snippets."
  url "http://seancribbs.com"
  
  define_routes do |map|
    map.resources :searches, :path_prefix => '/admin'
  end
  
  def activate
    unless defined?(PageListView)
      raise "The Page List View extension is required - install from RAILS_ROOT with 'script/extension install page_list_view'"
    end
    Page.send :include, SitemapSearch::Model
    Snippet.send :include, SitemapSearch::Model
    admin.page.index.add :top, 'admin/sitemap_search'
    admin.snippet.index.add :top, 'admin/sitemap_search'
  end
end