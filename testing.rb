# require('stripe')

Stripe.api_key = 'sk_test_51Lf7pfSJzlB81hid7ELfWU8RjP1NUqP2uGVhrY9Otlm5CYZj205R5dm6UBbW9YgdL0PQXmFSKs8DmTKiKH0I44ze00H7cPGw5O'

print('Enter price: ')
pp = gets.chomp.to_i

price = Stripe::Price.create({
                               unit_amount: pp,
                               currency: 'inr',
                               product: 'prod_MNtfJfgelhnFe6'
                             })

order = Stripe::PaymentLink.create(
  line_items: [{ price: price.id, quantity: 1 }],
  after_completion: { type: 'redirect', redirect: { url: 'https://shobhitjain.live' } }
)
system('xdg-open', order.url)