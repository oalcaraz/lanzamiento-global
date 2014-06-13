class AddPaymentOkToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :payment_ok, :boolean
    add_column :accounts, :stripe_id, :integer
  end
end
