FROM python:3.8-buster

ARG arg_image_created

WORKDIR /app

COPY ./entrypoint.sh /root/entrypoint.sh

RUN \
  pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/ \
  && pip install --no-cache-dir jupyterlab

LABEL \
  me.ggicci.jupyter.image.created="${arg_image_created}" \
  me.ggicci.jupyter.image.version="0.1.6" \
  me.ggicci.jupyter.image.revision="" \
  me.ggicci.jupyter.image.authors="Ggicci <ggicci.t@gmail.com>" \
  me.ggicci.jupyter.image.url="https://images.ggicci.me/ggicci/jupyter" \
  me.ggicci.jupyter.image.documentation="https://github.com/ggicci/jupyter" \
  me.ggicci.jupyter.image.source="https://github.com/ggicci/jupyter" \
  me.ggicci.jupyter.image.vendor="GGICCI.ME" \
  me.ggicci.jupyter.image.licenses="MIT" \
  me.ggicci.jupyter.image.title="Jupyter Lab" \
  me.ggicci.jupyter.image.description="Jupyter lab service"

ENTRYPOINT [ "/root/entrypoint.sh" ]

