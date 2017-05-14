class User < ApplicationRecord
  require 'bcrypt'
  has_secure_password

  has_many :lists
end
