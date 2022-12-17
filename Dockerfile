# read the doc: https://huggingface.co/docs/hub/spaces-sdks-docker
# you will also find guides on how best to write your Dockerfile

FROM python:3.9

WORKDIR /code

RUN USER=$(whoami); mkdir -p .config/matplotlib; chown -R $USER:$USER .config/matplotlib

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --prefer-binary -U -r /code/requirements.txt

COPY . .

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "7860"]
