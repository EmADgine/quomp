require 'spec_helper'

describe "Pages" do
    describe "Entrance Page" do
        it "should have the content 'At Quomp ..." do
            visit '/pages/home'
            expect(page).to have_content('At Quomp')
        end
    end
    describe "Create CP" do 
        it "should have the content 'Create Your User Profile'" do
            visit '/pages/cpp'
            expect(page).to have_content('Create Your User Profile')
        end
    end
    describe "Create PP" do 
        it "should have the content 'Populate Your User Profile'" do
            visit '/pages/ppp'
            expect(page).to have_content('Populate Your User Profile')
        end
    end

end
