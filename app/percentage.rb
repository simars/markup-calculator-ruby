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

  module Fixed
    def self.percentage(quantity)
      base_value = 10000.0
      total_value = base_value * quantity
      evaluated_value = evaluate(base_value,quantity)
      ((evaluated_value - total_value)/total_value) * 100.0
    end

    def self.evaluate(base_value, quantity)
      slabs = quantity / 1000
      residue = quantity % 1000

      evaluated_value = (0..slabs-1).inject(Float(0)) do | evaluated_value, value |
        evaluated_value+= (base_value * 1000) * (1 + (value + 5) / 100.0)
        evaluated_value
      end
      evaluated_value += (base_value * residue) * (1 + (slabs +5 ) / 100.0)
      return evaluated_value
    end
  end

end