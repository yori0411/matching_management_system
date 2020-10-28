class User < ApplicationRecord
<<<<<<< HEAD
    has_many :texts, primary_key: 'user_id', foreign_key: 'user_id'
=======
    # has_secure_password
>>>>>>> ce2f1d9d95dac4c6f66c71ee19ed3daf304b12cd
end
