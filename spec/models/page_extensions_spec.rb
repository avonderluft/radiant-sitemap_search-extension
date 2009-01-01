require File.dirname(__FILE__) + '/../spec_helper'

describe Page, "search" do
  scenario :pages

  before :each do
    if defined?(ConcurrentDraft)
      pages(:first).parts.first.update_attributes(:draft_content => "Special draft content")
    else
      pages(:first).parts.first.update_attributes(:content => "Special content")
    end
  end
  
  it "should find pages from words in the title" do
    Page.search('radius').should include(pages(:radius))
  end
  
  it "should find pages from words in the keywords" do
    Page.search('harmonious').should include(pages(:assorted))
  end
  
  it "should find pages from words in the description" do
    Page.search('sweet').should include(pages(:assorted))
  end
  
  it "should find pages from words in the slug" do
    Page.search('article-4').should include(pages(:article_4))
  end
  
  it "should find pages from words in the parts content" do
    Page.search('world!').should include(pages(:home))
  end
  
  it "should find pages from words in the content" do
    Page.search('special').should include(pages(:first))
  end
end