require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  # SETUP
  before :each do
    @user = User.create!(first_name: 'Wedge', last_name: 'Antilles', email: 'x@x.co', password: 'chewie', password_confirmation: 'chewie')
  end

  scenario "UserLogins" do
    # ACT
    visit '/login'
    fill_in 'email', with: 'x@x.co'
    fill_in 'password', with: 'chewie'
    click_on 'Submit'
    # DEBUG
    save_screenshot
    #VERIFY
    expect(page).to have_content('Products')
  end
end
