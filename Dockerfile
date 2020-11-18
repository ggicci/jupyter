FROM python:3.8-buster

WORKDIR /app

RUN pip install jupyterlab

ARG arg_image_created

LABEL \
  me.ggicci.jupyter.image.created="${arg_image_created}" \
  me.ggicci.jupyter.image.version="0.1.0" \
  me.ggicci.jupyter.image.revision="" \
  me.ggicci.jupyter.image.authors="Ggicci <ggicci.t@gmail.com>" \
  me.ggicci.jupyter.image.url=""
