class CashPayment < Pay
  def initialize(payment_id, price)
    @payment_id = payment_id
    @price = price
  end

  def execute
    payment = Payment.find(@payment_id)
    payment.price = @price
    payment.accepted = true
    payment.save
  end
end