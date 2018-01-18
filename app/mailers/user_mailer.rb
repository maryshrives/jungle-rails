class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(order)
    @email = order.email
    @order = order
    mail(to: @email, subject: "Your Jungle Order Details: # #{@order.id}")
  end
end