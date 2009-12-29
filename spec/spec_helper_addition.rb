module SpecHelperAddition

  def login(factory_name = :foo)
    user = Factory.create(factory_name.to_sym)
    controller.stubs(:current_user).returns(user)
    mock_user_session = stub("user_session")
    mock_user_session.stubs(:destroy).returns(user)
    UserSession.stubs(:find).returns(mock_user_session)
  end
  alias_method :login_as, :login
  alias_method :mock_login, :login

  def logout
    @user_session = nil
  end

end
