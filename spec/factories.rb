Factory.sequence :username do |n|
  "test_user_#{n}"
end
Factory.sequence :email do |n|
  "test#{n}@email.com"
end

Factory.define :user do |u|
  u.username Factory.next :username
  u.email Factory.next :email
  u.password '11111'
  u.password_confirmation '11111'
end

Factory.define :foo, :parent => :user do |f|
  f.username 'foo'
  f.email 'foo@email.com'
  f.password 'secret'
  f.password_confirmation 'secret'
end

Factory.define :bar, :parent => :user do |f|
  f.username 'bar'
  f.email 'bar@email.com'
  f.password 'secret'
  f.password_confirmation 'secret'
end
