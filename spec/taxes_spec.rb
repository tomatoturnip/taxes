require 'rspec'
require_relative '../lib/taxes'

describe TaxPayer do

  let(:johnny_smith) {TaxPayer.new('Johnny', 'Smith', 120000, 28000, 38)}

  it 'has a first name' do
    expect(johnny_smith.first_name).to eq('Johnny')
  end

  it 'has a last name' do
    expect(johnny_smith.last_name).to eq('Smith')
  end

  it 'has an annual income' do
    expect(johnny_smith.annual_income).to eq(120000)
  end

  it 'has tax paid' do
    expect(johnny_smith.tax_paid).to eq(28000)
  end

  it 'has tax rate of' do
    expect(johnny_smith.tax_rate).to eq(0.38)
  end

  it 'has a balance due' do
    expect(johnny_smith.balance_due).to eq(17600)
  end

  it 'has a string of tax payer info printed out' do
    expect(johnny_smith.print_out).to eq("Johnny Smith owes $17600.00 in taxes")
  end

end
