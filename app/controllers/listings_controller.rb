class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @buying_listings = @category.listings.where("lower(name) LIKE ?", "%#{params[:search].downcase}%").where(is_sell: false)
      @selling_listings = @category.listings.where("lower(name) LIKE ?", "%#{params[:search].downcase}%").where(is_sell: true)
    else
      @buying_listings = Listing.where("lower(name) LIKE ?", "%#{params[:search].downcase}%").where(is_sell: false)
      @selling_listings = Listing.where("lower(name) LIKE ?", "%#{params[:search].downcase}%").where(is_sell: true)
    end
  end

  def show
    @category = Category.find(params[:category_id])
    @comment = @listing.comments.new
  end

  def new
    @category = Category.find(params[:category_id])
    @listing = Listing.new
  end

  def edit
    @category = Category.find(params[:category_id])
  end

  def create
    @category = Category.find(params[:category_id])
    @listing = @category.listings.build(listing_params)

    respond_to do |format|
      if @listing.save
        current_user.listings << @listing
        format.html { redirect_to category_listing_path(@category, @listing), notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @category = Category.find(params[:category_id])
    @listing = @category.listings.build(listing_params)

    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to category_listing_path(@category, @listing), notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:name, :description, :is_sell, :asking_price, :price_negotiable)
  end
end
