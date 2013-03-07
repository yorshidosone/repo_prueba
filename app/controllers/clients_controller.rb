#encoding: utf-8
class ClientsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  
  # GET /clients
  # GET /clients.json
  def index
    if params[:term]
      @clients = Client.find(:all, :conditions => ['user_id = ' + "#{current_user.user_id}" +
                  ' and nombre LIKE ?', "%#{params[:term]}%"])
    else
      @clients = Client.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients.to_json }
  end
end
  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client, :layout => true }
      
    end
  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    @client = Client.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client, :layout => "application" }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(params[:client])
    @client.user_id = current_user.user_id
    
    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Cliente fue creaado satisfactoriamente.' }
        format.js
        format.json { render json: @client, status: :created, location: @client }
      else
        format.html { render action: "new" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to @client, notice: 'Cliente fue actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Página protegida, por favor inicie sesión."
      end
    end   
end
