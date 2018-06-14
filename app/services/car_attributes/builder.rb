module CarAttributes
  class Builder
    def initialize car
      @car = car
    end

    def basic_details obj
      {
        name: obj.name,
        value: obj.value
      }
    end

    def list
      objs_details = []
      @car.car_attributes.each {|obj| objs_details.push( basic_details(obj) )}
      objs_details
    end

  end
end
