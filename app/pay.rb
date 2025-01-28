class PayProcess
  def initialize(payment_type, price)
    @payment_type = payment_type
    @price = price
    @payment = Payment.new(payment_type: @payment_type)
  end

  def execute_payment
    if @payment.save

      case @payment_type
      when 'cash'
        CashPayment.execute(@payment.id, price)
      when 'credit_card'
        CreditCardPayment.execute(@payment.id, price)
      end
    end
  end
end
