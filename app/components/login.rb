require_relative 'login/display'
require_relative 'login/events'
require_relative 'login/server'

class TestApp
  module Components
    class Login < Wedge::Component
      name :login

      include LoginDisplay
      include LoginServer

      wedge_on_server LoginServer

      # http://codepen.io/andytran/pen/PwoQgO
      html './public/login.html' do
        head    = dom.find('head')
        html    = dom.find('html')

        head.append stylesheet_tag 'app'
        head.append stylesheet_tag 'login'
        html.append javascript_tag 'app'

        title_dom = dom.find('.pen-title')
        title_dom.find('h1').html 'ACD - Test - Login'
        title_dom.find('span').remove

        dom.find('.cta a').attr 'href', 'javascript:{};'
      end
    end
  end
end
