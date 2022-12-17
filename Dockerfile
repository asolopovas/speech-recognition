# read the doc: https://huggingface.co/docs/hub/spaces-sdks-docker
# you will also find guides on how best to write your Dockerfile

FROM python:3.9
USER www-data

WORKDIR /code


RUN chown www-data:www-data /code
RUN mkdir -p /var/www; chown -R www-data:www-data /var/www

RUN pip install --no-cache-dir --prefer-binary -U -r /code/requirements.txt

COPY . .
ENV MPLCONFIGDIR=/tmp/matplotlib
COPY ./requirements.txt /code/requirements.txt

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "7860"]
