#encoding: utf-8
require 'num.rb'
class FacturasController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  # GET /facturas
  # GET /facturas.json
  def index
    @facturas = Factura.paginate(page: params[:page], :per_page => 10, :order => 'fecha DESC')

    respond_to do |format|
      format.html # index.html.erb
      
      format.json { render json: @facturas }
    end
  end

  # GET /facturas/1
  # GET /facturas/1.json
  def show
    @factura = Factura.find(params[:id])
    data = render_to_string( :action => :imprimir, :layout => false )
    File.open("/home/aggero/Desktop/factura.html", "w"){|f| f << data }
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @factura }
    end
  end

  # GET /facturas/new
  # GET /facturas/new.json
  def new
    @factura = Factura.new
    facturas_producto = @factura.facturas_productos.build 

  end


  # POST /facturas
  # POST /facturas.json
  def create
    @factura = Factura.new(params[:factura])
    @factura.activa = 1 
    @factura.fecha = Time.now

    respond_to do |format|
      if @factura.save
        format.html { redirect_to @factura, notice: 'La Factura fue creada satisfactoriamente.' }
        format.json { render json: @factura, status: :created, location: @factura }
      else
        format.html { render action: "new" }
        format.json { render json: @factura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /facturas/1
  # PUT /facturas/1.json
  def update
    @factura = Factura.find(params[:id])
    @factura.activa = 0
    respond_to do |format|
      if @factura.update_attributes(params[:factura])
        format.html { redirect_to facturas_path, notice: 'La factura fue cancelada.' }
        format.json { head :no_content }
      else
        format.html { render action: "index" }
        format.json { render json: @factura.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def search
    if params[:factura_id].exists?
      u = Factura.where('id = ?', params[:factura_id]).first
    end
    puts u.path
  end
  
  private
  
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Por favor inicie sesión."
      end
    end  
end
