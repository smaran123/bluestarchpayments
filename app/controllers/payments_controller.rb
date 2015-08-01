class PaymentsController < ApplicationController
 before_action :payment, only: [:payment_pdf, :show, :destroy, :update,:next_step, :thankyou]
 #before_action :verify_token, only: [:show, :payment_pdf]

 def index
# @payments = Payment.all
     @payments = params[:search] ? Payment.search(params[:search]) : Payment.all

end

def new
  @payment = Payment.new
end

def create
  @payment = Payment.new(payment_params)
  @payment.token = generated_token
  if @payment.save
    gflash success: "Payments was successfully created."
      # send email with the link to sign the payment
      # PaymentMailer.payment_confirmation(@payment).deliver
      redirect_to payment_url(@payment, signature_token: @payment.token)
    else
      gflash :now, error: @payment.errors.full_messages.join("<br/>").html_safe
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
    @signature = Sign.new
  end

  def payment_pdf
        render pdf: "#{@payment.product_name}"
  end

  private

  def payment_params
    params.require(:payment).permit!
  end
  def payment
    @payment = Payment.find(params[:id])
  end 
end


