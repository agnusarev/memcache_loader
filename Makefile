# Makefile
.PHONY: test
test:
	poetry run pytest tests/

.PHONY: linting
linting:
	poetry run isort src
	poetry run black --line-length 120 src
	poetry run flake8 --ignore=E226,E302,E41,W191,W503 --max-complexity=13 --max-line-length=120 src

.PHONY: mypy
mypy:
	poetry run mypy src

.PHONY: run_loader
run_loader:
	poetry run python src/memcache_loader/memc_load.py --pattern=data/*.tsv.gz --dry

.PHONY: run_loader_mp
run_loader_mp:
	poetry run python src/memcache_loader/memc_load_mp.py --pattern=data/*.tsv.gz --dry
