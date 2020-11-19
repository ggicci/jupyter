FROM python:3.8-buster

WORKDIR /app

RUN pip install jupyterlab

ARG arg_image_created

LABEL \
  me.ggicci.jupyter.image.created="${arg_image_created}" \
  me.ggicci.jupyter.image.version="0.1.0" \
  me.ggicci.jupyter.image.revision="" \
  me.ggicci.jupyter.image.authors="Ggicci <ggicci.t@gmail.com>" \
  me.ggicci.jupyter.image.url="https://images.ggicci.me/ggicci/jupyter" \
  me.ggicci.jupyter.image.documentation="https://github.com/ggicci/jupyter" \
  me.ggicci.jupyter.image.source="https://github.com/ggicci/jupyter" \
  me.ggicci.jupyter.image.vendor="GGICCI.ME" \
  me.ggicci.jupyter.image.licenses="MIT" \
  me.ggicci.jupyter.image.title="Jupyter Lab" \
  me.ggicci.jupyter.image.description="Jupyter lab service"

ENTRYPOINT [ "jupyter", "lab", "--no-browser", "--allow-root" ]

