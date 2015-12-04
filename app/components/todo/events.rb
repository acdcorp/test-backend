class TestApp
  module Components
    class Todo < Wedge::Component
      name :todo

      on :click, '.taskAdd, .taskDelete' do |el, evt|
        evt.prevent_default

        button_class_name = el.attr 'class'

        `alert('Clicked ' + button_class_name)`
      end
    end
  end
end
