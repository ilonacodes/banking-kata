class Account

  def initialize
    @transactions = []
  end

  def print_statement
    header = "Date\t\tAmount\tBalance\n"
    # rows = Date.today.strftime("%m/%d/%Y") + "\t\t100\t100"
    rows = transactions.map do |amount|
      Date.today.strftime("%m/%d/%Y") + "\t\t" + amount.to_s + "\t100"
    end

    string = ""
    rows.each do |row|
      string += row
    end

    header + string
  end

  def deposit(amount)
    transactions.push(amount)
  end

  private

  attr_reader :transactions

end