require 'rspec'
require_relative './../app/percentage'
require_relative './../app/markup'

describe Percentage do

  it 'should calculate simple percentages' do
    simple_percentage = Percentage::Simple.percentage(20, 50, 10)
    simple_percentage.should == Float(80.0)
  end

  it 'should calculate compound percentages' do
    compound_percentage = Percentage::Compound.percentage(20, 50, 10)
    compound_percentage.should == Float(98.0)
  end
end