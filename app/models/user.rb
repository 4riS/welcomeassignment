class User < ApplicationRecord
    def self.create_with_omniauth(auth)
        create! do |user|
          user.uid = auth["uid"]
          user.name = auth["info"]["name"]
          user.photo_url = auth["info"]["image"] 
        end
      end
end
