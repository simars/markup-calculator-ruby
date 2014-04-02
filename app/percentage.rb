module Percentage

  module Simple

    def self.percentage(*values)
      return values.inject(Float(0)) do |simple_value, value|
        simple_value + Float(value)
      end
    end

    def self.evaluate(base_value, *values)
      return float(base_value) * (1 + (self.percentage(values)));
    end

  end

  module Compound

    def self.percentage(*values)
      base_value = Float(1)
      compound_value = self.evaluate(base_value, *values)
      return (compound_value-base_value)* Float(100)
    end

    def self.evaluate(base_value, *values)
      return values.inject(Float(base_value)) do |compounded_value, value|
        compounded_value *= Float(1) + Float(value) / Float(100)
        compounded_value
      end
    end

  end

end