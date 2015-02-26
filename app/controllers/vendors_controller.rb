class VendorsController < ApplicationController
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    @vendors = Vendor.where(:user_id => current_user.id)

    vendor_name = []
    vendor_amount = []
    @vendors.each do |v|
      vendor_name << v.name
      vendor_amount << sum_amount(find_baskets_of_vendor(v.id))
    end

    @chartVendor = LazyHighCharts::HighChart.new('bar') do |f|
      f.series(:name=> 'Betrag', :showInLegend => false, :data=> vendor_amount)
      f.options[:chart][:defaultSeriesType] = "bar"
      f.options[:xAxis] = {:plot_bands => "none", :title=>{:text=>"Kategorien"}, :categories => vendor_name}
      f.options[:yAxis][:title] = {:text=>"Euro"}
      f.options[:chart][:backgroundColor] = 'rgba(0, 0, 0, 0)'
    end

    respond_with(@vendors)
  end

  def show
    @filteredBaskets = Basket.where(:vendor_id => @vendor.id, :user_id => current_user.id)
    respond_with(@vendor, @filteredBaskets)
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
    # Logo-Deletion, only Logolink = null, filedelete not implemented
    if vendor_params[:remove_logo] == "1"
      @logo = vendor_params[:logo]
      @logo.nil?

    end
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
      params.require(:vendor).permit(:name, :logo, :remove_logo, :user_id)
    end
end
