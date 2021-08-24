# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new
user.name     = 'Test Abc'
user.phone    = '081234567890'
user.birthday = '1990-01-01'
user.email    = 'testabc@abctest.com'
# user.password = 'testabctesting'
user.save

store = Store.new
store.name    = 'Kudu Cuan'
store.address = 'online ajah'
store.status  = :active
store.save

store = Store.new
store.name    = 'Toko Online'
store.address = 'online ajah'
store.status  = :active
store.save

product = Product.new
product.store_id = 1
product.code = 'KC001'
product.name = 'Kecap Bango'
product.status = :active
product.save

product = Product.new
product.store_id = 1
product.code = 'KC002'
product.name = 'Sambel Roa'
product.status = :active
product.save

product = Product.new
product.store_id = 2
product.code = 'TO001'
product.name = 'Tissue'
product.status = :active
product.save

product = Product.new
product.store_id = 2
product.code = 'TO002'
product.name = 'Kantong Plastik'
product.status = :active
product.save

product_variant = ProductVariant.new
product_variant.product_id = 1
product_variant.code = 'KC001001'
product_variant.name = '100 ml'
product_variant.status = :active
product_variant.save

product_variant = ProductVariant.new
product_variant.product_id = 1
product_variant.code = 'KC001002'
product_variant.name = '300 ml'
product_variant.status = :active
product_variant.save

product_variant = ProductVariant.new
product_variant.product_id = 2
product_variant.code = 'KC002'
product_variant.name = '50 ml'
product_variant.status = :active
product_variant.save

product_variant = ProductVariant.new
product_variant.product_id = 3
product_variant.code = 'TO001001'
product_variant.name = '900 gram'
product_variant.status = :active
product_variant.save

product_variant = ProductVariant.new
product_variant.product_id = 4
product_variant.code = 'TO002'
product_variant.name = '100 pcs'
product_variant.status = :active
product.save
