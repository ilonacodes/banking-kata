require_relative 'spec_helper'
require '../lib/print_statement'

describe PrintStatement do
  it 'prints a statement' do
    print_statement = PrintStatement.new
    expect(STDOUT).to receive(:puts).with('date     || credit || debit || balance')
    print_statement.render
  end
end