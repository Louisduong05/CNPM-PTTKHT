require "rails_helper"

RSpec.describe Customer, :type => :model do
  context "with 2 or more exports" do
    it "can create customer" do
      customer = Customer.create(name: "Thach", phone: "+8493274628734", address: "Address 1")
      expect(Customer.first).to eq(customer)
    end
  end
end