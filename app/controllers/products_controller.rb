class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :destroy]

  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    unless @product.user_specifics.blank?
      @user_specifics = JSON.parse(@product.user_specifics)
    else
      @user_specifics = {}
    end
  end


  # PATCH/PUT /products/1
  def update
    
    outcome = UpdateProduct.run!(title: params["product"]["title"],
                                        id: params["id"],
                                      description: params["product"]["description"],
                                      selected_specifics: params["product"]["user_specifics"].to_json.to_s
                                )
                                    
    puts "outcome=#{outcome.inspect}"                                    
    
    redirect_to products_path
    
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
    
end
