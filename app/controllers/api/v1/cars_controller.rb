class Api::V1::CarsController < ApiController
  before_action :is_driver

def create
  car = current_user.cars.new(car_params)
  if car.save
    render_car_details car
  else
    obj_errors car
  end
end

def update
  if @obj.update_attributes(car_params)
    render_car_details @obj
  else
    obj_errors @obj
  end
end

def index
  Cars::Builder.new.list  Car.include(:rates, :car_attributes)
end


  private

  def resource_name
    'Car'
  end

  def is_driver
    fail NotDriverError unless current_user.has_role? :driver
  end

  def car_params
    params.require(:car).permit(
      :id,
      car_attributes_attributes: [:id, :name, :value],
      rates_attributes: [:id, :per, :price]
    )
  end

  def render_car_details car
    render json: MultiJson.dump(Cars::Builder.new(car).basic_details)
  end



end
