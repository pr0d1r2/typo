require File.dirname(__FILE__) + '/../../spec_helper'

# test standard view and all themes
[ nil, "dirtylicious", "scribbish", "standard_issue", "typographic" ].each do |theme|
  view_path = theme ? "#{RAILS_ROOT}/themes/#{theme}/views" : "" 
  describe "#{view_path}/articles/index" do
    before(:each) do
      @controller.view_paths = [ "#{RAILS_ROOT}/themes/#{theme}/views" ] if theme
      # we only want to test pagination links
      ActionView::Base.class_eval do
        def article_links(article)
          ""
        end
        alias :category_links :article_links
        alias :tag_links :article_links
      end
    end
  
    context "normally" do
      before(:each) do
        @controller.action_name = "index"
        assigns[:articles]   = Article.find(:all, :limit => 4)
      end
    
      it "should have pagination link to page 2 without q param" do
        assigns[:pages]      = ArticlesController::Paginator.new ArticlesController, assigns[:articles].size, 2, params[:page] # (2 per page)
        render "articles/index"
        response.should have_tag("a[href=?]", "/page/2")
      end
      
      it "should have pagination link to page 1 without q param if on page 2" do
        params[:page]        = 2
        assigns[:pages]      = ArticlesController::Paginator.new ArticlesController, assigns[:articles].size, 2, params[:page] # (2 per page)
        render "articles/index"
        response.should have_tag("a[href=?]", "/page/1")
      end
    end
    
    # *notice
    # this assumptions has "&amp;", i don`t know why, but we want only to test the q= param in link and have separated this test from controller
    context "when search" do
      before(:each) do
        @controller.action_name = "search"
        params[:q]           = "body"
        assigns[:articles]   = Article.search(params[:q]) # this is used by  this_blog.articles_matching in ArticlesController (gives U 4 articles)    
      end
    
      it "should have pagination link to page 2 with q param" do
        params[:page]        = 1
        assigns[:pages]      = ArticlesController::Paginator.new ArticlesController, assigns[:articles].size, 2, params[:page] # (2 per page)
        render "articles/index"
        response.should have_tag("a[href=?]", "/search?page=2&amp;q=body") # *notice
      end
      
      it "should have pagination link to page 1 with q param if on page 2" do
        params[:page]        = 2
        assigns[:pages]      = ArticlesController::Paginator.new ArticlesController, assigns[:articles].size, 2, params[:page] # (2 per page)
        render "articles/index"
        response.should have_tag("a[href=?]", "/search?page=1&amp;q=body") # *notice
      end    
    end
  end
end
