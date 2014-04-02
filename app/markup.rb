module Markup

  FIXED_MARKUP = 5.0
  FOOD_MARKUP = 13.0
  ELECTRONICS_MARKUP = 2.0
  PERSON_MARKUP = 1.2
  DRUGS_MARKUP = 7.5
  OTHER_MARKUP = 0.0

  module Calculator

    class << self
      def compound(*percentages)
        Percentage::Compound.percentage(*percentages)
      end

      def simple(*percentages)
        Percentage::Simple.percentage(*percentages)
      end
    end

    def self.evaluate(base_value, number_of_person, material_markup)
      percentage_value = compound(FIXED_MARKUP,
                                  simple((number_of_person * PERSON_MARKUP), material_markup))
      return base_value *= (1 + percentage_value/Float(100))

    end
  end


end