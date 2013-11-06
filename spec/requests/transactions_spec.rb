require 'spec_helper'

begin
describe "Transactions" do

=begin
    describe "confirmatransaction" do

      it "should have the content 'confirmation'" do
        visit '/tansaction/confirmationtransaction'
        expect(page).to have_content('confirmation')
      end
    end
    describe "with valid information" do
      let!(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "name",    with: user.name
        fill_in "card_number",    with:transaction.card_number
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
=end
end
end
