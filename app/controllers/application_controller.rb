class ApplicationController < ActionController::Base

    protect_from_forgery

    before_filter :set_language

    # Dajmy dostęp w widoku
    helper_method :current_cart

    private

      def current_cart
        Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
      end

      def set_language
        I18n.locale = ['en', 'pl'].include?(params[:lang]) ? params[:lang] : nil || I18n.default_locale
      end
  end