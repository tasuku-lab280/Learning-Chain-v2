class ApplicationController < ActionController::Base
  before_action :get_tag
  include SessionsHelper

  private

    def get_tag
      @tags = Tag.all
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインが必要です。"
        redirect_to login_url
      end
    end

end
 