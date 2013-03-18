class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  private
  def set_locale
    if params[:locale]  == ''
      I18n.locale = :cn
    else
      I18n.locale = params[:locale]
    end
    # I18n.locale = params[:locale] || :cn
  end

  def default_url_options(options = {})
    { :locale => ((I18n.locale == I18n.default_locale) ? '' : I18n.locale) }
  end
end
