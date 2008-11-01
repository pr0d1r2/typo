require File.dirname(__FILE__) + '/../../../test/test_helper'
require File.dirname(__FILE__) + '/../../spec_helper'
require 'admin/cache_controller'

# Re-raise errors caught by the controller.
class Admin::CacheController; def rescue_action(e) raise e end; end

describe Admin::CacheController, "rough port of the old functional test" do

  before(:each) do
    request.session = { :user => users(:tobi).id }
  end

  context 'sweep action' do

    it 'should redirect to setting index' do
      get 'sweep'
      response.should redirect_to(:controller => '/admin/settings')
    end

    ## due to notice in admin/pages_controller_spec
    # XXX: The flash is currently being made available improperly to tests (scoop)
    #it 'should send notice' do
    #  get 'sweep'
    #  flash[:notice].should == 'Cache was cleared' 
    #end

  end

  context 'sweep_html action' do

    it 'should redirect to setting index' do
      get 'sweep_html'
      response.should redirect_to(:controller => '/admin/settings')
    end

    ## due to notice in admin/pages_controller_spec
    # XXX: The flash is currently being made available improperly to tests (scoop)
    #it 'should send notice' do
    #  get 'sweep_html'
    #  flash[:notice].should == 'HTML was cleared' 
    #end

  end

end
