all:
	@echo "Jekyll website for xknx.io"
	@echo ""
	@echo "Preparations:"
	@echo ""
	@echo "\tsudo gem install jekyll bundler
	@echo "\tsudo gem install github-pages"
	@echo "\tbundle install  ""
	@echo ""
	@echo "Available targets"
	@echo ""
	@echo "build - build website"
	@echo ""
	@echo "serve - start webservice on localhost: http://localhost:4000/"
	@echo ""
	@echo "clean"

build:
	bundle exec jekyll build

serve:
	bundle exec jekyll serve

clean:
	bundle exec jekyll clean

