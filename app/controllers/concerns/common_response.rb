module CommonResponse
  extend ActiveSupport::Concern

  def render_obj obj = nil
    render json: @obj
  end

  def obj_errors obj=nil
    obj ||= @obj
    render json: { message: 'Validation failed', errors: obj.errors.full_messages }, status: 422
  end

  def query_params
    params.permit!.to_h.with_indifferent_access
  end

  def render_success
    render json: {success: true}
  end

  def render_error msg, code
    render json: { message: msg }, status: code
  end

end
