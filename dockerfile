From alpine

MAINTAINER Brian Moore "bmoore@linux.com"

RUN apk update && \
    apk add --no-cache \
    python-dev \
    py-pip && \
    pip install --upgrade pip setuptools && \
    rm -r /root/.cache

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

EXPOSE 80

ENTRYPOINT [ "python" ]
CMD [ "app.py" ]
