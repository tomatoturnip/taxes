require 'csv'
require 'pry'

class TaxPayer

  def initialize(first_name, last_name, annual_income, tax_paid, tax_rate)
    @first_name = first_name
    @last_name = last_name
    @annual_income = annual_income.to_f
    @tax_paid = tax_paid.to_f
    @tax_rate = (tax_rate.to_f/100)
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def annual_income
    @annual_income
  end

  def tax_paid
    @tax_paid
  end

  def tax_rate
    @tax_rate
  end

  def balance_due
    ((@annual_income * @tax_rate) - @tax_paid)
  end

  def print_out
    if self.balance_due < 0
      "#{@first_name} #{@last_name} will receive a refund of $#{'%.2f' % self.balance_due.abs}"
    else
      "#{@first_name} #{@last_name} owes $#{'%.2f' % self.balance_due} in taxes"
    end
  end

end

tax_system = []
CSV.foreach('../tax.csv', headers: true) do |row|
  tax_system << TaxPayer.new(
                             row['first_name'],
                             row['last_name'],
                             row['annual_income'],
                             row['tax_paid'],
                             row['tax_rate']
                             )
end


# binding.pry

tax_system.each do |tax_person|
  puts tax_person.print_out
end







