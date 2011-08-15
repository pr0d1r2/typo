require File.dirname(__FILE__) + '/../../spec_helper'
<<<<<<< HEAD
require 'admin/cache_controller'

# Re-raise errors caught by the controller.
class Admin::CacheController; def rescue_action(e) raise e end; end
=======
>>>>>>> 31479d7b23c6cff5c7b3f9fa7d1b7239d5ba76f3

describe Admin::CacheController, "rough port of the old functional test" do

  before(:each) do
    request.session = { :user => users(:tobi).id }
  end

<<<<<<< HEAD
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
=======
  describe 'sweep_html action' do
>>>>>>> 31479d7b23c6cff5c7b3f9fa7d1b7239d5ba76f3

    it 'should redirect to setting index' do
      get 'sweep_html'
      response.should redirect_to(:controller => '/admin/settings')
    end

<<<<<<< HEAD
    ## due to notice in admin/pages_controller_spec
    # XXX: The flash is currently being made available improperly to tests (scoop)
    #it 'should send notice' do
    #  get 'sweep_html'
    #  flash[:notice].should == 'HTML was cleared' 
    #end

=======
>>>>>>> 31479d7b23c6cff5c7b3f9fa7d1b7239d5ba76f3
  end

end
