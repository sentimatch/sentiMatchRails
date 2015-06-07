module Concerns
  module Users
    module CheckedinUsers
      extend ActiveSupport::Concern

      EXPIRY_TIME = 60

      def check_in(location_id)
        # $redis.hset(HASH_KEY, self.id, location_id)
        $redis.set(self.id, location_id)
        $redis.expire(self.id, EXPIRY_TIME)
      end

      module ClassMethods
        def checkedin_users(location_id)
          # user_ids = $redis.hgetall(HASH_KEY).select{ |k, v| v == location_id}.keys
          # User.where(id: user_ids)
          user_ids = $redis.keys.select { |a| $redis.get(a) == location_id }
          User.where(id: user_ids)
        end      
      end

    end
  end
end