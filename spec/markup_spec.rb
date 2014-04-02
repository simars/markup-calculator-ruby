require 'rspec'
require_relative './../app/percentage'
require_relative './../app/markup'



describe Markup do
  it 'should calculate markup
     * Input 1:
     * --------
     * $1299.99
     * 3 people
     * food
     * <p/>
     * Output 1: $1591.58' do

    evaluated_value = Markup::Calculator.evaluate(1299.99,3,Markup::FOOD_MARKUP)
    evaluated_value.should be_within(0.01).of(1591.58)
  end

  it 'should calculate markup
      * Input 2:
     * --------
     * $5432.00
     * 1 person
     * drugs
     * <p/>
     * Output 2: $6199.81' do

    evaluated_value = Markup::Calculator.evaluate(5432.00,1,Markup::DRUGS_MARKUP)
    evaluated_value.should be_within(0.01).of(6199.81)
  end

  it 'should calculate markup
     * Input 3:
     * --------
     * $12456.95
     * 4 people
     * books
     * <p/>
     * Output 3: $13707.63' do

    evaluated_value = Markup::Calculator.evaluate(12456.95,4,Markup::OTHER_MARKUP)
    evaluated_value.should be_within(0.01).of(13707.63)
  end

end