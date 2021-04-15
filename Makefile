.DEFAULT_GOAL := init
.PHONY: prepare-dev install-dev data help lint test coverage publish publish_test doc doc-pdf visu-doc-pdf visu-doc tox
VENV = ".my_great_project"

#
# Sotware Installation in the system (need root access)
# -----------------------------------------------------
#
init:
	python3 setup.py install

prepare-dev:
	git init && echo "python3 -m venv my_great_project-env && export PYTHONPATH=. && export PATH=`pwd`/my_great_project-env/bin:${PATH}" > ${VENV} && echo "source \"`pwd`/my_great_project-env/bin/activate\"" >> ${VENV} && scripts/install-hooks.bash && echo "\nnow source this file: \033[31msource ${VENV}\033[0m"

install-dev:
	pip install -r requirements.txt && pip install -r requirements_dev.txt && pre-commit install && pre-commit autoupdate

coverage:  ## Run tests with coverage
	coverage erase
	coverage run --include=my_great_project/* -m pytest -ra
	coverage report -m

lint:  ## Lint and static-check
	flake8 --ignore=E203,E266,E501,W503,F403,F401 --max-line-length=79 --max-complexity=18 --select=B,C,E,F,W,T4,B9 my_great_project
	pylint my_great_project
	mypy my_great_project

test:  ## Run tests
	pytest -ra

tox:
	tox -e py37

doc:
	make html -C docs

doc-pdf:
	make doc && make latexpdf -C docs

visu-doc-pdf:
	acroread docs/build/latex/my_great_project.pdf

visu-doc:
	firefox docs/build/html/index.html

data:
	pip install -r requirements-data.txt && python scripts/data_download.py

publish_test:
	flit publish --repository pypitest

publish:
	flit publish
