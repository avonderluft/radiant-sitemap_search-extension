require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::SearchController do
  dataset :users
  
  [:admin, :designer].each do |user|
    describe "search as user with #{user} privileges" do
      before :each do
        @page, @snippet, @layout = mock_model(Page), mock_model(Snippet), mock_model(Layout)
        Page.stub!(:search).and_return([@page])
        Snippet.stub!(:search).and_return([@snippet])
        Layout.stub!(:search).and_return([@layout])
        login_as user
      end
      
      def do_get
        get :index, :q => 'radiant'
      end
      it "should search pages" do
        Page.should_receive(:search).with('radiant').and_return([@page])
        do_get
      end
      it "should search snippets" do
        Snippet.should_receive(:search).with('radiant').and_return([@snippet])
        do_get
      end
      it "should search layouts" do
        Layout.should_receive(:search).with('radiant').and_return([@layout])
        do_get
      end
      if defined?(TemplatesExtension)
        it "should search templates" do
          @banner = mock_model(Template)
          Template.stub!(:search).and_return([@template])
          Template.should_receive(:search).with('radiant').and_return([@template])
          do_get
        end
      end
      if defined?(BannerRotatorExtension)
        it "should search banners" do
          @banner = mock_model(Banner)
          Banner.stub!(:search).and_return([@banner])
          Banner.should_receive(:search).with('radiant').and_return([@banner])
          do_get
        end
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

  [:existing, :non_admin].each do |user|
    describe "search as user with #{user} privileges" do
      before :each do
        @page, @snippet, @layout = mock_model(Page), mock_model(Snippet), mock_model(Layout)
        Page.stub!(:search).and_return([@page])
        Snippet.stub!(:search).and_return([@snippet])
        Layout.stub!(:search).and_return([@layout])
        login_as user
      end
      
      def do_get
        get :index, :q => 'radiant'
      end

      it "should search pages" do
        Page.should_receive(:search).with('radiant').and_return([@page])
        do_get
      end
      it "should not search snippets" do
        Snippet.should_not_receive(:search).with('radiant')
        do_get
      end
      it "should not search layouts" do
        Layout.should_not_receive(:search).with('radiant')
        do_get
      end
      if defined?(TemplatesExtension)
        it "should not search templates" do
          @banner = mock_model(Template)
          Template.stub!(:search).and_return([@template])
          Template.should_not_receive(:search).with('radiant')
          do_get
        end
      end
      if defined?(BannerRotatorExtension)
        it "should not search banners" do
          @banner = mock_model(Banner)
          Banner.stub!(:search).and_return([@banner])
          Banner.should_not_receive(:search).with('radiant')
          do_get
        end
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

end
