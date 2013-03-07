class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    user = User.find_by_empresa(params[:session][:empresa].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'El nombre de la empresa o el password son incorrectos, favor de verificar'
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to signup_path
  end
end
