require_relative '../../../lib/double_dog.rb'  

user = DoubleDog.db.create_user(username: 'alice', password: 'beer', admin: true)
result = DoubleDog::SignIn.new.run(:username => user.username, password: 'beer')
$session_id = result[:session_id]

item1 = DoubleDog.db.create_item(name: 'taco', price: 2)
item2 = DoubleDog.db.create_item(name: 'pizza', price: 3)
item3 = DoubleDog.db.create_item(name: 'sandwich', price: 4)

order1 = DoubleDog.db.create_order(employee_id: 501, items: [item1])

user2 = DoubleDog.db.create_user(username: 'random dude', password: 'alcohol', admin: false)