
require 'spec_helper'

describe Emailer do
  describe 'instructions' do
    let(:item) { mock_model(:item_id => '1', :title => "MyString", :category =>"MyString", :description => "MyString", :condition => "MyString", :duration =>12, :price =>1, :user_id => 1, :total_quantity => 10, :quantity => 5)}
    let(:user) { mock_model(:userid => '2', :email => 'lucas@email.com', :password => '12341234', :first_name =>'Tung-Keng Lee', :last_name => 'Lee', :street => '5700 Centre Ave.', :country => 'USA', :zip =>'15206', :phone => '4126801073') }
    let(:mail) { Emailer.deliver_contact(1, 2) }

    #ensure that the subject is correct
    it 'renders the subject' do
      mail.subject.should == 'Illegal Item Report'
    end

    #ensure that the receiver is correct
    it 'renders the receiver email' do
      mail.to.should == ['bestbay2013fall@gmail.com']
    end

    #ensure that the sender is correct
    it 'renders the sender email' do
      mail.from.should == ['risingfalcons19@gmail.com']
    end


  end
  end

