class ApplicationController < ActionController::API
  def render_errors(model)
    errors = {}

    model.errors.as_json.map do |error|
      message = error.second.map do |message|
        "#{error.first.to_s.humanize} #{message}"
      end

      errors[error.first] = message
    end

    render status: 422, json: { errors: errors }
  end
end
