class PrintStatement
  def initialize(transactions = [])
    @transactions = transactions
  end

  def render
    print_form
  end

  def print_form
    puts 'date     || credit || debit || balance'
  end
end