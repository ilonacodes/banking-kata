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
    current_date = Date.today.strftime("%m/%d/%Y")
    header = "Date\t\tAmount\tBalance\n"
    amount = 100

    account.deposit(amount)

    expect(account.print_statement).to eq(header + current_date +
                                              +"\t\t100\t100")
  end

  it 'can deposit 3 transactions' do
    account = Account.new
    current_date = Date.today.strftime("%m/%d/%Y")
    header = "Date\t\tAmount\tBalance\n"

    amount_one = 100
    account.deposit(amount_one)

    amount_two = 200
    account.deposit(amount_two)

    amount_three = 300
    account.deposit(amount_three)
    expect(account.print_statement).to eq(header +
                                              current_date + "\t\t100\t100\n" +
                                              current_date + "\t\t200\t300\n" +
                                              current_date + "\t\t300\t600")

  end

  it 'can deposit one transaction and withdraw one transaction' do
    account = Account.new
    current_date = Date.today.strftime("%m/%d/%Y")
    header = "Date\t\tAmount\tBalance\n"

    amount = 100
    account.deposit(amount)

    amount_withdraw = 50
    account.withdraw(amount_withdraw)
    expect(account.print_statement).to eq(header +
                                              current_date + "\t\t100\t100\n" +
                                              current_date + "\t\t-50\t50")
  end

  it 'can deposit one transaction, withdraw two transactions,
      deposit two transactions and one withdraw' do
    account = Account.new
    current_date = Date.today.strftime("%m/%d/%Y")
    header = "Date\t\tAmount\tBalance\n"

    amount_one = 100
    account.deposit(amount_one)

    amount_two = 50
    account.withdraw(amount_two)

    amount_three = 50
    account.withdraw(amount_three)

    amount_four = 100
    account.deposit(amount_four)

    amount_five = 100
    account.deposit(amount_five)

    amount_six = 200
    account.withdraw(amount_six)

    expect(account.print_statement).to eq(header +
                                              current_date + "\t\t100\t100\n" +
                                              current_date + "\t\t-50\t50\n" +
                                              current_date + "\t\t-50\t0\n" +
                                              current_date + "\t\t100\t100\n" +
                                              current_date + "\t\t100\t200\n" +
                                              current_date + "\t\t-200\t0")
    puts account.print_statement
  end

end