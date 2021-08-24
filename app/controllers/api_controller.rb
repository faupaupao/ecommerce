# frozen_string_literal: true

class ApiController < ActionController::API
  # before_action :authenticate_application!

  rescue_from StandardError, with: :error_500
  rescue_from ActiveRecord::RecordNotFound, with: :error_404 # unless Rails.env.development?

  def error_500(exception)
    puts '-------------------------------------------------- ERROR --------------------------------------------------'
    puts exception.message
    puts exception.backtrace.first
    puts '-------------------------------------------------- ERROR --------------------------------------------------'

    if Rails.env.production?
      ExceptionNotifier.notify_exception(exception, env: request.env, data: { backtrace: exception.backtrace.first, params: params })
    end

    render json: { code: 500, messages: [:internal_server_error] }, status: 500
  end

  def error_404(message = e.message)
    render json: {
      messages: [message],
      code: 404,
      data: {}
    }, status: 404
  end

  def error_400(message = [''])
    render json: {
      messages: message,
      code: 400,
      data: []
    }, status: 400
  end

  def error_401(messages = [:unauthorized])
    render json: {
      messages: messages,
      code: 401,
      data: []
    }, status: 401
  end

  def authenticate_application!
    token   = request.headers['Authorization'] || ''
    officer = Api::Token::Validator.new(token: token)

    unless officer.valid?
      messages = [:unauthorized]
      messages += officer.errors unless Rails.env.production?

      error_401(messages)
    end
  end
end
