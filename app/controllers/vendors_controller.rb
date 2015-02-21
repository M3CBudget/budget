class VendorsController < ApplicationController
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @vendors = Vendor.where(:user_id => current_user.id)
    respond_with(@vendors)
  end

  def show
    respond_with(@vendor)
  end

  def new
    @vendor = Vendor.new
    respond_with(@vendor)
  end

  def edit
  end

  def create
    @vendor = Vendor.new(vendor_params)
    @vendor.save
    respond_with(@vendor)
  end

  def update
    @vendor.update(vendor_params)
    respond_with(@vendor)
  end

  def destroy
    @vendor.destroy
    respond_with(@vendor)
  end

  private
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    def vendor_params
      params.require(:vendor).permit(:name, :logo)
    end
end
