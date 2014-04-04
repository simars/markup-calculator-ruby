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

  it 'should calculate markup
     * Input 4:
     * --------
     * $1
     * quantity 2000
     * 0 people
     * other at 0%
     * <p/>
     * Output 3: $2110.0' do

    evaluated_value = Markup::Calculator.evaluate(1,0,Markup::OTHER_MARKUP,2000)
    evaluated_value.should be_within(0.01).of(2110.0)
  end


  it 'should calculate markup
     * Input 5:
     * --------
     * $2
     * quantity 2000
     * 0 people
     * other  at 0%
     * <p/>
     * Output 3: $4220.0' do

    evaluated_value = Markup::Calculator.evaluate(2,0,Markup::OTHER_MARKUP,2000)
    evaluated_value.should be_within(0.01).of(4220.0)
  end

  it 'should calculate markup
     * Input 6:
     * --------
     * $1
     * quantity 2500
     * 0 people
     * other at 0%
     * <p/>
     * Output 3: 2645.0' do

    evaluated_value = Markup::Calculator.evaluate(1,0,Markup::OTHER_MARKUP,2500)
    evaluated_value.should be_within(0.01).of(2645.0)
  end

  it 'should calculate markup
     * Input 7:
     * --------
     * $1
     * quantity 2500
     * 5 people at 1.2% each
     * food at 13%
     * <p/>
     * Output 3: 3147.55' do

    evaluated_value = Markup::Calculator.evaluate(1,5,Markup::FOOD_MARKUP,2500)
    evaluated_value.should be_within(0.01).of(3147.55)
  end


  it 'should calculate markup
     * Input 8:
     * --------
     * $27.65
     * quantity 2500
     * 5 people at 1.2% each
     * food at 13%
     * <p/>
     * Output 3: 87029.76' do

    evaluated_value = Markup::Calculator.evaluate(27.65,5,Markup::FOOD_MARKUP,2500)
    evaluated_value.should be_within(0.01).of(87029.76)
  end

end