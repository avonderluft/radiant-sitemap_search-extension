module Admin::SearchHelper
  include Admin::ListViewHelper
  
  def link_text(object)
    case object
    when Page
      icon = object.virtual? ? 'virtual-page' : 'page'
      %Q{#{image(icon, :height => 18)} <span class="title">#{object.title}</span>}
    when Snippet
      %Q{#{image('snippet', :height => 18)} <span class="title">#{object.name}</span>}
    when Banner
      %Q{#{image('pictures', :height => 18)} <span class="title">#{object.name}</span>}
    end
  end
  
  def link_url(object)
    case object
    when Page; edit_admin_page_path(:id => object)
    when Snippet; edit_admin_snippet_path(:id => object)
    when Banner; edit_admin_banner_path(:id => object)
    end
  end
  
  def link_attrs(object)
    {:title => object.url } if Page === object
  end
  
  def cell_class(object)
    'page'
  end
end
