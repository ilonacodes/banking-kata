class Account

  def initialize
    @transactions = []
  end

  def print_statement
    header = "Date\t\tAmount\tBalance\n"
    current_date = Date.today.strftime("%m/%d/%Y")
    balance = 0

    rows = transactions.map do |amount|
      balance += amount
      current_date + "\t\t" + amount.to_s + "\t" + balance.to_s
    end

    header + rows.join("\n")
  end

  def deposit(amount)
    transactions.push(amount)
  end

  def withdraw(amount)
    transactions.push(-amount)
  end

  private

  attr_reader :transactions

end