class UserController < ApplicationController

  def user_confirmation
    @user= User.new(params[:userid],params[:password])
    cookies[:user] = @user.to_yaml
  end

  def homepage
    @user = YAML.load(cookies[:user])
  end

  def required_registration
    if params.has_key?(:userid) &&
      !params[:userid].strip.empty? && params.has_key?(:password)&& !params[:password].strip.empty?
        cookies[:userid]=params[:userid]
        cookies[:password]=params[:password]
    end
  end

end #end class
