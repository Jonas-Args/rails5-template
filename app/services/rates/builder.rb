module Rates
  class Builder
    def initialize car
      @car = car
    end

    def basic_details obj
        {
          per: obj.per,
          rate: obj.price
        }
    end

    def list
      objs_details = []
      @car.rates.each {|obj| objs_details.push( basic_details(obj) )}
      objs_details
    end

  end
end
