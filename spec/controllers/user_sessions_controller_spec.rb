require File.dirname(__FILE__) + '/../spec_helper'
 
describe UserSessionsController do

  integrate_views

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "new action should redirect to the account page if there's a user has logged in already" do
    mock_login
    get :new
    response.should redirect_to(account_url)
  end
  
  it "create action should render new template when authentication is invalid" do
    UserSession.any_instance.expects(:save).returns(false)
    post :create, :user_session => { :username => "foo", :password => "badpassword" }
    response.should render_template(:new)
    UserSession.find.should be_nil
  end
  
  it "create action should redirect when authentication is valid" do
    Factory.create :foo
    post :create, :user_session => { :username => "foo", :password => "secret" }
    response.should redirect_to(root_url)
  end

  it "destroy action should redirect when there's a user has logged in" do
    mock_login
    delete :destroy
    flash[:notice].should  == "You have been logged out."
    response.should redirect_to(root_url)
  end
  
end
