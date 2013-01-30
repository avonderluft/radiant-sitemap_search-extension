# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class SitemapSearchExtension < Radiant::Extension
  version "#{File.read(File.expand_path(File.dirname(__FILE__)) + '/VERSION')}"
  description "Adds simple search feature for pages, snippets, layouts, et al."
  url "https://github.com/avonderluft/radiant-sitemap_search-extension"

  def activate
    unless defined?(PageListView)
      raise "The Page List View extension is required - install from RAILS_ROOT with 'script/extension install page_list_view'"
    end
    tab "Content" do
      add_item "Search", '/admin/search'
    end
    Page.send :include, SitemapSearch::Model
    Layout.send :include, SitemapSearch::Model
    admin.layout.index.bottom.delete 'new_button'
    admin.layout.index.add :bottom, 'admin/search/layout_index_bottom'
    if defined?(SnippetsExtension)
      Snippet.send :include, SitemapSearch::Model
      admin.snippet.index.bottom.delete 'new_button'
      admin.snippet.index.add :bottom, 'admin/search/snippet_index_bottom'
    end
    if defined?(TemplatesExtension)
      Template.send :include, SitemapSearch::Model
      admin.template.index.bottom.delete 'new_button'
      admin.template.index.add :bottom, 'admin/search/template_index_bottom'
    end
    if defined?(BannerRotatorExtension)
      Banner.send :include, SitemapSearch::Model
      admin.banner.index.bottom.delete 'new_button'
      admin.banner.index.add :bottom, 'admin/search/banner_index_bottom'
    end
  end

end