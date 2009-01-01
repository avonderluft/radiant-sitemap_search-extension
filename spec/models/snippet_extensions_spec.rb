require File.dirname(__FILE__) + '/../spec_helper'

describe Snippet, "search" do
  scenario :snippets
  before :each do
    if defined?(ConcurrentDraft)
      snippets(:first).update_attributes(:draft_content => "Special draft content")
    else
      snippets(:first).update_attributes(:content => "Special content")
    end
  end
  
  it "should find snippets from words in the name" do
    Snippet.search('first').should include(snippets(:first))
  end
  
  it "should find snippets from words in the content" do
    Snippet.search('Before').should include(snippets(:yielding))
  end
  
  it "should find snippets from words in the content" do
    Snippet.search('special').should include(snippets(:first))
  end
end