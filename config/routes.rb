ActionController::Routing::Routes.draw do |map|
  map.search 'admin/search', :controller => 'admin/search', :action => 'index'
end