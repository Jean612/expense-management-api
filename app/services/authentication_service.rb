class AuthenticationService
  def self.call(email, password)
    user = User.find_by(email: email)

    # Si las credenciales son incorrectas, devuelve un error
    return { success: false, error: 'Invalid email or password' } unless user&.valid_password?(password)

    # Si las credenciales son correctas, genera el token
    token = JwtService.encode({ user_id: user.id })
    { success: true, token: token }
  end
end
