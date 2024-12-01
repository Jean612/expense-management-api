# app/middleware/api_token_authenticator.rb
class ApiTokenAuthenticator
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    token = request.get_header('HTTP_API_TOKEN') || request.get_header('API_TOKEN') || request.params['api_token']

    if token_valid?(token)
      @app.call(env)
    else
      [401, { 'Content-Type' => 'application/json' }, [{ error: 'Unauthorized' }.to_json]]
    end
  end

  def token_valid?(token)
    token == ENV['API_TOKEN']
  end
end
