# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{radiant-sitemap_search-extension}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrew vonderLuft", "Sean Cribbs"]
  s.date = %q{2011-04-22}
  s.description = %q{Adds search feature for pages, snippets, layouts, et al.}
  s.email = %q{avonderluft@avlux.net}
  s.extra_rdoc_files = [
    "README.textile"
  ]
  s.files = [
    "HELP.textile",
    "README.textile",
    "Rakefile",
    "VERSION",
    "app/controllers/admin/search_controller.rb",
    "app/helpers/admin/search_helper.rb",
    "app/views/admin/pages/index.html.haml",
    "app/views/admin/pages/page_list_view.html.haml",
    "app/views/admin/search/_banner.html.haml",
    "app/views/admin/search/_banner_index_bottom.html.haml",
    "app/views/admin/search/_layout.html.haml",
    "app/views/admin/search/_layout_index_bottom.html.haml",
    "app/views/admin/search/_results_nav.html.haml",
    "app/views/admin/search/_search_action.html.haml",
    "app/views/admin/search/_snippet.html.haml",
    "app/views/admin/search/_snippet_index_bottom.html.haml",
    "app/views/admin/search/_template.html.haml",
    "app/views/admin/search/_template_index_bottom.html.haml",
    "app/views/admin/search/index.html.haml",
    "config/locales/en.yml",
    "config/routes.rb",
    "lib/sitemap_search/model.rb",
    "lib/tasks/sitemap_search_extension_tasks.rake",
    "pkg/radiant-sitemap_search-extension-1.0.0.gem",
    "radiant-sitemap_search-extension.gemspec",
    "sitemap_search_extension.rb",
    "spec/controllers/search_controller_spec.rb",
    "spec/models/page_extensions_spec.rb",
    "spec/models/snippet_extensions_spec.rb",
    "spec/spec.opts",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{https://github.com/avonderluft/radiant-sitemap_search-extension}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Sitemap Search Extension for Radiant CMS}
  s.test_files = [
    "spec/controllers/search_controller_spec.rb",
    "spec/models/page_extensions_spec.rb",
    "spec/models/snippet_extensions_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<radiant>, [">= 1.0.0"])
    else
      s.add_dependency(%q<radiant>, [">= 1.0.0"])
    end
  else
    s.add_dependency(%q<radiant>, [">= 1.0.0"])
  end
end

