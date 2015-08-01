class PaymentMailer < ApplicationMailer
 default from: "Bluarch Support Team <support@bluearc.com>"

  def payment_confirmation(payment)
    @payment = payment
    mail(to: payment.email, subject: 'Please confirm payment and sign it')
  end

  def payment_pdf(payment)
    @payment = payment
     mail(:to => [payment.email, 'smaranreddy123@gmail.com'], :subject => 'Thankyou, You Payment was confirmed and signed ')

  end
end
