require_relative 'spec_helper'
require_relative '../lib/account'
require 'date'

RSpec.describe 'Account' do
  it 'creates a new account' do
    Account.new
  end

  it 'creates account without transactions' do
    account = Account.new

    expect(account.print_statement).to eq("Date\t\tAmount\tBalance\n")
  end

  it 'can deposit one transaction' do
    account = Account.new
    amount = 100

    account.deposit(amount)

    expect(account.print_statement).to eq("Date\t\tAmount\tBalance\n" +
                                       + Date.today.strftime("%m/%d/%Y") + "\t\t100\t100")
  end

  # it 'can deposit 3 transactions' do
  #   account = Account.new
  #   amount = 0
  #
  #   expect(account.deposit(amount)).to eq(10)
  #   expect(account.deposit(amount)).to eq(50)
  #   expect(account.deposit(amount)).to eq(100)
  #
  # end
end