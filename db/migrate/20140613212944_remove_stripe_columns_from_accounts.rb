class RemoveStripeColumnsFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :stripe_id, :integer
    remove_column :accounts, :payment_ok, :boolean
    add_column :accounts, :stripe_charge, :string
  end
end
