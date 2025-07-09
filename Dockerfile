FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY backend/requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt

COPY backend /app

CMD ["gunicorn", "docker_dj.wsgi:application", "-c", "/gunicorn/gunicorn.conf.py"]
