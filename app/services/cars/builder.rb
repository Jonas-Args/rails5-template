module Cars
  class Builder
    def initialize car=nil
      @car = car
    end

    def basic_details car=@car
       car.attributes.merge(
         car_attributes: CarAttributes::Builder.new(car).list,
         rates:  Rates::Builder.new(car).list
       )
    end

    def list list
      objs_details = []
      list.each { |car| objs_details.push( basic_details(car) )}
      objs_details
    end

  end
end

# select * from cars
# select * from rates where id in [1,2,3]
#
# Car.include(:rates).each do |car|
#   car.rates
# end
