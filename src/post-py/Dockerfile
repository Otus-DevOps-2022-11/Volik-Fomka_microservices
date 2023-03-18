# Build stage
FROM python:3.6.0-alpine AS build

RUN apk --no-cache add build-base

WORKDIR /app
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Final stage
FROM python:3.6.0-alpine

WORKDIR /app
COPY --from=build /app /app

ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts

ENTRYPOINT ["python3", "post_app.py"]
