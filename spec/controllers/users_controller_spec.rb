require File.dirname(__FILE__) + '/../spec_helper'
 
describe UsersController do
  integrate_views
  
  it "show action should render the show template if the user has logged in" do
    controller.stubs(:current_user).returns(Factory(:user, :username => 'corntrace'))
    get :show
    response.should be_success
    response.should have_tag('div.nav', /corntrace/) do
      with_tag('a', 'Logout')
    end
  end

  it "show action should redirect to the login page if no user has logged in" do
    controller.stubs(:logged_in?).returns(nil)
    get :show
    flash[:error].should_not be_blank
    response.should redirect_to('/login') 
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    User.any_instance.stubs(:valid?).returns(false)
    do_post
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    User.any_instance.stubs(:valid?).returns(true)
    do_post
    flash[:notice].should_not be_blank
    response.should redirect_to(root_url)
  end

  private
  def do_post
    post :create, {:username => 'test', :email => "test@test.com", :password => '11111', :password_confirmation => '11111'}
  end

end
