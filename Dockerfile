FROM python:2.7-alpine

RUN mkdir -p /usr/src/app /config/zones /config/logs
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

COPY cloudflare-ddns.py /usr/src/app
COPY config/zones/* /config/zones/

VOLUME /config

ENTRYPOINT ["python", "cloudflare-ddns.py"]
