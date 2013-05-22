require 'spec_helper'

describe "Pages" do
  
  describe "register" do
  
    before do
      visit new_user_registration_path
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Sign up"
    end

    describe "it should create and sign in the user" do
      subject { page }
      it { should have_content('') }
    end
    
  end

end