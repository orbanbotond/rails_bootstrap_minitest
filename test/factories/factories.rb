Factory.define :search_audit do |f|
end

Factory.define :purchasing_system do |f|
  f.name "Oracle"
end

Factory.define :system_version do |f|
  f.name "11.5.10"
end

Factory.define :client do |f|
  f.name {Faker::Name.name}
  f.authentication_key "asdasdasd"
  f.purchasing_system {Factory :purchasing_system}
  f.system_version {Factory :system_version}
  f.category_schema "UNSPSC"
  f.account_status "Active"
  f.comment Faker::Lorem.paragraph
end

Factory.define :user do |f|
  f.email {Faker::Internet.email}
  f.role "buyer"
  # f.password f.password_confirmation 'buyerbuyer'
  f.password 'buyerbuyer'
  f.password_confirmation('buyerbuyer')
end

Factory.define :supplier do |f|
  f.name {Faker::Name.name}
  f.website {Faker::Internet.url}
  f.catalog_exists true
  f.active true
  f.comment {Faker::Lorem.paragraph}
end

Factory.define :agreement do |f|
  f.agreement_type      "Negotiated Prices"
  f.erp_supplier_name   "ERP Supplier"
  f.erp_supplier_number "ERP Supplier Number"
  f.refresh_basis       "weekly"
  f.active              true
  f.comment             ""
  f.client {Factory :client}
  f.supplier {Factory :supplier}
end


Factory.define :product do |f|
  f.short_description "MyText"
  f.long_description "MyText"
  f.currency "USD"
  f.manufacturer_part_number "MyText"
  f.manufacturer_name "MyText"
  f.thumbnail_url "MyString"
  f.image_url "MyString"
  f.commodity_code "MyString"
  f.commodity_name "MyText"
  # f.agreement {Factory :agreement}
end

Factory.define :price do |f|
  f.price {1.33}
  f.supplier_part_number "MyText"
  f.unit_of_measurement_code "MyS"
  f.unit_of_measurement "Mystring"
  #The agreement and product need to be set up manually
  # @agreement = Factory :agreement
  # @product = Factory :product, agreement: @agreement
  # @price_for_different_agreement = Factory :price, product: @product, price: 1.7
  # @price_for_different_product = Factory :price, agreement: @agreement, price: 1.99
  # @price1_for_product = Factory :price, product: @product, price: 0.8, agreement: @agreement
  # @price2_for_product = Factory :price, product: @product, price: 1.2, agreement: @agreement

  f.agreement {Factory :agreement}
  f.product {Factory :product}
end
