require File.dirname(__FILE__) + '/../spec_helper'

describe SearchesController do
  scenario :users
  
  before :each do
    @snippet, @page = mock_model(Snippet), mock_model(Page)
    Snippet.stub!(:search).and_return([@snippet])
    Page.stub!(:search).and_return([@page])
    login_as :existing
  end
  
  describe "GET to /admin/searches" do
    def do_get
      get :index, :q => 'radiant'
    end
    
    it "should search snippets" do
      Snippet.should_receive(:search).with('radiant').and_return([@snippet])
      do_get
    end
    
    it "should search pages" do
      Page.should_receive(:search).with('radiant').and_return([@page])
      do_get
    end
    
    it "should render the index template" do
      do_get
      response.should render_template('index')
    end
    
    it "should be successful" do
      do_get
      response.should be_success
    end
  end
end
