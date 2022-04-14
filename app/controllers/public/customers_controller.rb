class Public::CustomersController < ApplicationController

def show
  @customer = current_customer
end

def edit
  @customer = current_customer
end

def update
  @customer = current_customer
  @customer.update(current_customer)
  redirect_to public_customer_path(current_customer)
end

end
