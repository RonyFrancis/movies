module V1
  class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    def login; end

    # login
    def login_verify
      @user = User.where('username=? and password=?', params[:username], params[:password]).first
      if @user.blank?
        redirect_to '/v1/login'
      else
        session[:user_id] = @user.id
        redirect_to '/v1/dashboard'
      end
    end

    # logout session
    def destroy
      session[:user_id] = nil
      redirect_to '/v1/login'
    end
  end
end
