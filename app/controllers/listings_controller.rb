class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @category = Category.find(params[:category_id])
    @listings = @category.listings
  end

  def show
    @category = Category.find(params[:category_id])
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
        format.html { redirect_to category_listing_path(@listing), notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
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
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
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
