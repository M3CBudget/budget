class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    @payments = Payment.where(:user_id => current_user.id)

    payment_name = []
    payment_amount = []
    @payments.each do |p|
      payment_name << p.name
      payment_amount << sum_amount(find_baskets_of_payment(p.id))
    end

    @chartPayments = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie"} )
      series = {
          :type=> 'pie',
          :data=> [
              [payment_name[0], payment_amount[0]],
          [ payment_name[1], payment_amount[1]],
          [ payment_name[2], payment_amount[2]],
          [ payment_name[3], payment_amount[3]]
          ]
      }
      f.series(series)
      f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'})
      f.plot_options(:pie=>{
                         :allowPointSelect=>true,
                         :cursor=>"pointer" ,
                         :dataLabels=>{
                             :enabled=>true,
                             :color=>"black",
                             :style=>{
                                 :font=>"13px Trebuchet MS, Verdana, sans-serif"
                             }
                         }
                     })
    end

    respond_with(@payments)
  end

  def show
    respond_with(@payment)
  end

  def new
    @payment = Payment.new
    respond_with(@payment)
  end

  def edit
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.save
    respond_with(@payment)
  end

  def update
    @payment.update(payment_params)
    respond_with(@payment)
  end

  def destroy
    @payment.destroy
    respond_with(@payment)
  end

  private
    def set_payment
      @payment = Payment.find(params[:id])
    end

    def payment_params
      params.require(:payment).permit(:user_id, :number, :bic, :active, :name)
    end
end
