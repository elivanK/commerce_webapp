module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
  
  # we need to define the current_user property ones a user is
  # successfully connected.
    def connect
      self.current_user = find_verified_user
    end

    def disconnect
    end

    protected
    # If the user is logged in, this method will return a user
    # request.env['warden'] is environment variable containing info about current user
    def find_verified_user
      if verified_user = request.env['warden'].user
        verified_user
      else 
        reject_unauthorized_connection  
      end 
    end
  end
end
