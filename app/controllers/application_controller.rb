class ApplicationController < ActionController::API
    # require('stripe')
    
    rescue_from CanCan::AccessDenied do |exception|
        render json: "acess denied , you are not admin"
    end

    # def paymentp(price)
    #     require('stripe')

    #     Stripe.api_key = 'sk_test_51Lf7pfSJzlB81hid7ELfWU8RjP1NUqP2uGVhrY9Otlm5CYZj205R5dm6UBbW9YgdL0PQXmFSKs8DmTKiKH0I44ze00H7cPGw5O'

    #     # print('Enter price: ')
    #     pp = price * 100

    #     price = Stripe::Price.create({
    #                                 unit_amount: pp,
    #                                 currency: 'inr',
    #                                 product: 'prod_MNtfJfgelhnFe6'
    #                                 })

    #     order = Stripe::PaymentLink.create(
    #     line_items: [{ price: price.id, quantity: 1 }],
    #     after_completion: { type: 'redirect', redirect: { url: 'https://shobhitjain.live' } }
    #     )
    #     system('xdg-open', order.url)
    # end
    # def slot_payment(price)
    #     # debugger
    #     # require('stripe')
    #     # debugger

    
    #     Stripe.api_key = 'sk_test_51Lf7pfSJzlB81hid7ELfWU8RjP1NUqP2uGVhrY9Otlm5CYZj205R5dm6UBbW9YgdL0PQXmFSKs8DmTKiKH0I44ze00H7cPGw5O'
    
    #     price = Stripe::Price.create({
    #                                    unit_amount: price * 100,
    #                                    currency: 'inr',
    #                                    product: 'prod_MNtfJfgelhnFe6'
    #                                  })
    
    #     order = Stripe::PaymentLink.create(
    #       line_items: [{ price: price.id, quantity: 1 }],
    #       after_completion: { type: 'redirect', redirect: { url: 'http://localhost:3000/thanks' } }
    #     )
    #     system('xdg-open', order.url)
    # end

end
