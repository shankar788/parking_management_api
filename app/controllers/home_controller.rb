class HomeController < ApplicationController
  def index

  end

  def park_out
    if current_user
      @a = Slot.find_by(user_id:current_user.id)
      if @a == nil
        render json: {message: "Your not Right Owner"}
      else    
        @a.update(out_time:Time.now)
        UserHistory.create(in_time:@a.in_time,out_time:@a.out_time,status:@a.status,car_color:@a.car_color,car_number:@a.car_number)
        redirect_to park_update_path
      end  
    else  
      render json: {message: "Not current user"}
    end   
  end  

  def park_update
    if current_user
      @a = Slot.find_by(user_id:current_user.id)
      if @a.in_time != nil && @a.out_time != nil
        @time = (@a.out_time.to_time.to_i - @a.in_time.to_time.to_i).to_f / 60
        price = @time * 100/60
        slot_payment(price)
        # render json: @price
      else
        render json: {message: "Not parked"}  
      end
      @a.update(in_time:nil,out_time:nil,status:nil,car_color:nil,car_number:nil)
    end

  end 

  def slot_payment(price)
    # debugger
    require('stripe')
    # debugger


    Stripe.api_key = 'sk_test_51Lf7pfSJzlB81hid7ELfWU8RjP1NUqP2uGVhrY9Otlm5CYZj205R5dm6UBbW9YgdL0PQXmFSKs8DmTKiKH0I44ze00H7cPGw5O'

    price = Stripe::Price.create({
                                   unit_amount: price.to_i * 100,
                                   currency: 'inr',
                                   product: 'prod_MNtfJfgelhnFe6'
                                 })

    order = Stripe::PaymentLink.create(
      line_items: [{ price: price.id, quantity: 1 }],
      after_completion: { type: 'redirect', redirect: { url: 'http://localhost:3000/thanks' } }
    )
    system('xdg-open', order.url)
end

end
  