#encoding: utf-8
class ProductsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  # GET /products
  # GET /products.json
  def index
    if params[:term]
      @products = Product.find(:all, :conditions => ['user_id = ' + "#{current_user.user_id}" +
                  ' and descripcion LIKE ?', "#{params[:term]}%"])
    else
      @products = Product.all
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products.to_json }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Producto creado satisfactoriamente.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Producto actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
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
