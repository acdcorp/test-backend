.PHONY: test

default: server

server:
	bundle install && bundle exec rerun -b --pattern '{Gemfile,Gemfile.lock,.gems,.bundle,.env*,config.ru,Rakefile,**/*.{rb,js,coffee,css,scss,sass,styl,erb,html,haml,ru,yml,slim,md,mab,rake}}' -- thin start --port=8080

install: .env
	mkdir -p db/migrate
	bundle config path .bundle
	bundle install
	npm install
	bower install

.env:
	@cp env.example .env
