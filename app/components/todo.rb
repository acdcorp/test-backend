require 'date'
require_relative 'todo/display'
require_relative 'todo/events'

class TestApp
  module Components
    class Todo < Wedge::Component
      name :todo

      CATEGORIES = %w`personal work school cleaning other`

      include TodoDisplay

      # html is from http://codepen.io/yesimaaron/pen/JGHlq
      html './public/todo.html' do
        head    = dom.find('head')
        html    = dom.find('html')
        content = dom.find('.content')

        head.append stylesheet_tag 'app'
        head.append stylesheet_tag 'todo'
        html.append javascript_tag 'app'

        content.find('> h1').html 'Todo App'
        content.find('> p').html 'ACD - Backend Test'

        categories_select = dom.find('#category')

        categories_select.find('option').attr 'selected', 'selected'

        CATEGORIES.each do |category|
          categories_select.append html! {
            option category.titleize, value: category
          }
        end

        tmpl :task_item, dom.find('.taskItem')
      end

      def add_task description = '', category = '', date = Date.today, complete = false
        raise "#{category} is not in the list of CATEGORIES" unless CATEGORIES.include? category

        task_list_dom = dom.find('ul.taskList')
        task_item     = tmpl :task_item

        # Description
        description_dom = task_item.find('.description')
        description_dom.html description
        description_dom.add_class "complete-#{complete}"

        # Category
        category_dom = task_item.find('.category')
        category_dom.html category
        category_dom.add_class "category-#{category}"

        # Date
        date_dom = task_item.find('.date')
        date_dom.html date.strftime('%m/%d/%Y')
        date_dom.add_class "complete-#{complete}"

        task_list_dom.append task_item
      end
    end
  end
end
