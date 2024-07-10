class ApplicationController < ActionController::Base
  skip_forgery_protection

  rescue_from ActionController::UnknownFormat, with: :raise_not_found
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  rescue_from ActionDispatch::Http::Parameters::ParseError, with: :parameters_parse_error

  #Error handling
  def raise_not_found
    raise ActionController::RoutingError.new('Not supported format')
  end
  
  def record_not_found
    render json: { error: 'Todo list or Todo item not found' }, status: :not_found
  end

  def parameter_missing
    render json: { error: 'Missing parameter' }, status: :unprocessable_entity
  end

  def parameters_parse_error
    render json: { error: 'Parse error on parameters' }, status: :unprocessable_entity
  end
end
