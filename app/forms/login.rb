class TestApp
  module Forms
    class Login < Wedge::Plugins::Form
      name :login_form

      attr_accessor :username, :password

      def validate
        assert_present :username
        assert_present :password
      end
    end
  end
end
