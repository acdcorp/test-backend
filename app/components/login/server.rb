class TestApp
  module Components
    module LoginServer
      def login_user user
        ap user

        { success: false, errors: {
          username: ['Already Taken'] }
        }
      end
    end
  end
end
