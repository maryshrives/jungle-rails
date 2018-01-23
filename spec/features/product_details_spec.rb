require 'rails_helper'

RSpec.feature "Visitor clicks on the details button to see a product's page", type: :feature, js: true do
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

  scenario "Visitor navigates to home page, clicks on product details, and is taken to that product's page" do
    # ACT
    visit root_path
    first(:link, "Details").click

    #VERIFY
    # expect(page).to have_content("Reviews from our customers")
    expect(page).to have_css '.product-detail', count: 1

    # DEBUG
    save_screenshot #has to go at the end here b/c of async
  end
end
