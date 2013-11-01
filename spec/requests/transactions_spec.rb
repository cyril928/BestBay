require 'spec_helper'

describe "Transactions" do

    describe "confirmatransaction" do

      it "should have the content 'confirrmation'" do
        visit '/tansaction/confirmationtransaction'
        expect(page).to have_content('confirmation')
      end
    end
    describe "with valid information" do
      let!(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "name",    with: user.name
        fill_in "cardnum",    with:transaction.cardnum
        click_button "buy"
      end
      end

      #describe "GET /transactions" do
   # it "works! (now write some real specs)" do
    #  # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
     # get transactions_path
      #response.status.should be(200)
    #end
  #end
end
