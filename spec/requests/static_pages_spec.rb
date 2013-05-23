require 'spec_helper'

describe "Pages" do
  
  
  describe "register with valid information" do
    before do
      visit new_user_registration_path
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Sign up"
    end
    describe "it should create and sign in the user" do
      subject { page }
      it { should have_content('Welcome! You have signed up successfully.') }
    end
  end
  
  describe "user should be able to sign out" do
    before do
      click_link('Logout')
    end
  
  end

end

