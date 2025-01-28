class CreditCardPayment < Pay
  def initialize(payment_id, price)
    @payment_id = payment_id
    @price = price
  end

  def execute
    if ExternalIssuerService.getApproval(price, *)
      payment = Payment.find(@payment_id)
      payment.price = @price
      payment.accepted = true
      payment.save
    end
  end
end
