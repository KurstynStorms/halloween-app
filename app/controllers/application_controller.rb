class ApplicationController < ActionController::Base

  def format_errors(model)
    model.errors.map(&:full_message).join(", ")
  end
end
