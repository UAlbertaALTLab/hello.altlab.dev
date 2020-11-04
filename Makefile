requirements.txt: poetry.lock
	poetry export -f requirements.txt --without-hashes -o $@