gh-pages:
	git checkout gh-pages
	git checkout master -- .
	jekyll build
	ls | grep -v site_ | xargs rm -rf
	mc site_/* ./
	rm -rf site_
	touch .nojekyll
	git add -A
	git commit -m "publishing updated docs..."
	git push origin gh-pages
	# switch back
	git checkout master
