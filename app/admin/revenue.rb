ActiveAdmin.register Revenue do
  index do
    total_revenue = 0
    column :id
    column :name
    column :card_number
    column :expiry_date
    column :address
    column :amount
    column :is_transaction_revenue
    column :created_at
    column :updated_at
    column ("Cumulative Revenue") {|resource| total_revenue += resource.amount}
    default_actions
    div :class =>"panel" do
      h3 "Total Revenue: #{total_revenue}"
    end
  end
end
