require 'spec_helper'

describe "Pages" do
    describe "Entrance Page" do
        it "should have the content 'Here at Quomp ..." do
            visit '/pages/home'
            expect(page).to have_content('Here at Quomp')
        end
    end
    describe "Create PP" do 
        it "should have the content 'Create Your User Profile'" do
            visit '/pages/home'
            expect(page).to have_content('Create Your User Profile')
        end
    end
end
