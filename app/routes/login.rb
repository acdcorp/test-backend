TestApp.route('login') do |r|
  r.root do
    wedge(:login).to_js :display
  end
end
