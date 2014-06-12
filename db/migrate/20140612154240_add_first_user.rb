class AddFirstUser < ActiveRecord::Migration
  def change
    Account.create(
      email: 'martinb35@gmail.com',
      username: 'test',
      password: '123123123',
      password_confirmation: '123123123')
  end
end
