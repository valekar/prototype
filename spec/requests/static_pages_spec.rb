require 'spec_helper'

describe "Static Pages" do
   describe "Home Page" do
     before { visit static_pages_home_path }

     it "should have the content 'Home Page'" do
       expect(page).to have_content('Home Page')
     end

     it "should have title 'Prototype App | Home'" do
        expect(page).to have_title('Prototype App | Home')
     end
   end

  describe "Help Page" do
    before {visit static_pages_help_path}
    it  "should have content 'Help Page'" do
      expect(page).to have_content('Help Page')
    end

    it "should have title 'Help'" do
      expect(page).to have_title('Help')
    end
  end

  describe "About Us" do
    before {visit static_pages_about_path}
    it "should have content 'About Us'" do
      expect(page).to have_content('About Us')
    end

    it "should have title 'About'" do
      expect(page).to have_title('About')
    end
  end

   describe "Contact Us" do
     let(:contact) {'Contact'}
     before {visit static_pages_contact_path}
     it "should have content 'Contact Us'" do
       expect(page).to have_content(contact)
     end

     it "should have title 'Contact'" do
       expect(page).to have_title(contact)
     end
   end

end
