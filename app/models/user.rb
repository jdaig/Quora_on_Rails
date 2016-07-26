class User < ActiveRecord::Base
  
  include BCrypt
  # Remember to create a migration!
  # Remember to create a migration!
      # ej. User.authenticate('fernando@codea.mx', 'qwerty')
  has_many :questions
  
  validates :email, format: { with: /\w*[@][a-z]*[.][a-z]*/i, message: "Invalid email" } 
  validates :password, format: { with: /[A-Z][A-Za-z]*[0-9]*/, message: "Password must have, at least, one capital letter and one number " } 

  def self.authenticate(email, password)
    # si el email y el password corresponden a un usuario valido, regresa el usuario
    # de otra manera regresa nil
    #Bcrypt enabled
    user = User.find_by(email: email)
    if user && (user.password == password)
      return user
    else
      nil
    end
  end

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(user_password)
    @password = Password.create(user_password)
    self.password_digest = @password
  end
end
