module News
  class ApplicationController < ActionController::Base
    before_action :set_locale

    private

    def set_locale
      locale = if current_user
                 current_user.locale
               elsif params[:user_locale]
                 params[:user_locale]
               elsif session[:locale]
                 session[:locale]
               else
                 http_accept_language.compatible_language_from(I18n.available_locales)
               end

      if locale && I18n.available_locales.include?(locale.to_sym)
        session[:locale] = I18n.locale = locale
      else
        session[:locale] = I18n.locale = I18n.default_locale
      end
    end
  end
end
