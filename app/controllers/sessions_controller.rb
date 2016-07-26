class SessionsController < ApplicationController

  skip_before_filter  :verify_authenticity_token

  def index
    #recordar hacer la vista en el view de session
  end

  def logout
    session.clear
    @bulean2 = true
    redirect_to root_path
  end


end
