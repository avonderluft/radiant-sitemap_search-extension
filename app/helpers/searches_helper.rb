module SearchesHelper
  include Admin::ListViewHelper
  
  def link_text(object)
    case object
    when Page
      icon = object.virtual? ? 'virtual-page' : 'page'
      %Q{#{image(icon, :height => 18)} <span class="title">#{object.title}</span>}
    when Snippet
      %Q{#{image('snippet', :height => 18)} <span class="title">#{object.name}</span>}
    end
  end
  
  def link_url(object)
    case object
    when Page
      page_edit_path(:id => object)
    when Snippet
      snippet_edit_path(:id => object)
    end
  end
  
  def link_attrs(object)
    {:title => object.url } if Page === object
  end
  
  def cell_class(object)
    'page'
  end
end
