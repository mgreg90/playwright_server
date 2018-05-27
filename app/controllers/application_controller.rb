class ApplicationController < ActionController::API
  # Works well with ActiveRecord validations
  def validation_error_json model_instance
    msgs = model_instance.errors.map { |attr, msg| "#{attr} #{msg}" }
    { errors: msgs }
  end

  # Works well with SimpleCommand errors
  def command_error_json command
    {errors: command.errors}
  end
end
