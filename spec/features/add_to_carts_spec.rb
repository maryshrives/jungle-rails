require 'rails_helper'

RSpec.feature "Visitor clicks add to cart button on homepage", type: :feature, js: true do
    #SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "The product is added to the visitor's cart" do
    visit root_path
    first('.product').click_link('Add')
    # VERIFY
    expect(page).to have_content("My Cart (1)")
    # DEBUG
    # puts page.html
    save_screenshot
  end
end
