FROM python:3.12-slim

WORKDIR /app

COPY poetry.lock pyproject.toml README.md ./
COPY src/ src/
COPY data/ data/

RUN pip install poetry

RUN poetry config virtualenvs.in-project true && \
    poetry install --only=main --no-root && \
    poetry build

CMD ["poetry", "run", "python", "src/memcache_loader/memc_load_mp.py", "--pattern=data/*.tsv.gz", "--dry"]