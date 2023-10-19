class HomeController < ApplicationController
  layout "application", except: [:landing_page]
  before_action :authenticate_usuario!, only: [:dashboard]
  before_action :authenticate_administrador!, only: [:admin]

  def dashboard
  end

  def admin
  end
  def landing_page
    render layout: false
  end
end
