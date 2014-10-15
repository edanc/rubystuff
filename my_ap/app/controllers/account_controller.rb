class AccountController < ApplicationController
  def index
    redirect_to action: :login
  end

  def login
    user = User.authenticate(params[:sessions][:username], params[:sessions][:password])
    if user
      flash[:success] = "Succesfully logged in!  Don't forget to add your CRM Credentials first."
      session[:user_id] = user.id
      session[:admin] = user.admin
      redirect_to(:controller => 'sessions', :action => 'main') 
    else
      flash[:error] = "Wrong Username and/or Password"
      render :action => 'login'
    end
  end

  def logout
    session[:admin] = nil
    session[:user_id] = nil

    redirect_to :action => 'login'
  end

  def main
    @username = User.find(session[:user_id]).username
    if @username.nil?
      session[:user_id] = nil
      session[:admin] = nil
      redirect_to(:controller => 'sessions', :action => 'login') 
    end
  end
end

