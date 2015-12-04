class TestApp
  module Components
    module TodoDisplay
      def display
        add_task "created #{server?? 'server' : 'client'} side", 'work', Date.today, client?? true : false

        dom
      end
    end
  end
end
