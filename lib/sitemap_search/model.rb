module SitemapSearch::Model
  def self.included(base)
    base.extend ClassMethods
    base.send :cattr_accessor, :search_fields
    base.send :cattr_accessor, :includes
    if base == Page
      base.search_fields = [:title, :slug, :breadcrumb, :content]
      base.search_fields << :draft_content if defined?(ConcurrentDraftExtension)
      base.includes = [:parts]
    elsif base == Snippet
      base.search_fields = [:name, :content]
      base.search_fields << :draft_content if defined?(ConcurrentDraftExtension)
    elsif base == Layout
      base.search_fields = [:name, :content]
      base.search_fields << :draft_content if defined?(ConcurrentDraftExtension)
    elsif defined?(TemplatesExtension) && base == Template
      base.search_fields = [:name, :content]
    elsif defined?(BannerRotatorExtension) && base == Banner
      base.search_fields = [:name, :description, :background_image, :foreground_image, :link_url]
    end
  end
  
  module ClassMethods
    def search(query)
      # split up the words in the query, clear out blank ones
      words = query.strip.downcase.split(" ").reject(&:blank?)
      # return no results if query was blank
      return [] if words.empty?
      # wrap each one in the matchers and replicate by the number of fields
      wrapped_words = words.map {|word| ["%#{word}%"] * self.search_fields.size }
      # Construct conditions for each field
      field_conditions = self.search_fields.map {|field| "LOWER(#{field}) LIKE ?"}
      # join them with with an OR
      fields_per_word = field_conditions.join(" OR ")
      # replicate the condition for each word, join them all with an AND
      all_conditions = ([fields_per_word] * words.size).map {|stmt| "(#{stmt})"}.join(" AND ")
      query_conditions = [all_conditions, wrapped_words].flatten
      find(:all, :conditions => query_conditions, :joins => includes)
    end
  end
end