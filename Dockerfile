FROM python:3.9.6-buster

ARG arg_image_created
ARG arg_image_version
ARG arg_image_revision

ENV PIPENV_PYPI_MIRROR=https://mirrors.aliyun.com/pypi/simple/

# Install global packages
RUN \
  pip config set global.index-url ${PIPENV_PYPI_MIRROR} \
  && pip install --no-cache-dir jupyterlab==3.0.16 pipenv

# Root dir of this app
WORKDIR /app

# Install kernel for python2
RUN \
  mkdir -p /kernel/2.7 && cd /kernel/2.7 \
  && PIPENV_VENV_IN_PROJECT=1 pipenv --python python2.7 \
  && pipenv install ipykernel \
  && pipenv --clear \
  && KERNEL_VERSION=$( pipenv run python -V 2>&1 | cut -d' ' -f2 ) \
  && pipenv run python -m ipykernel install --name "${KERNEL_VERSION}" --display "Python ${KERNEL_VERSION}"

# Install kernel for python3
RUN \
  mkdir -p /kernel/3.9 && cd /kernel/3.9 \
  && PIPENV_VENV_IN_PROJECT=1 pipenv --python python3.9 \
  && pipenv install ipykernel \
  && pipenv --clear \
  && KERNEL_VERSION=$( pipenv run python -V 2>&1 | cut -d' ' -f2 ) \
  && pipenv run python -m ipykernel install --name "${KERNEL_VERSION}" --display "Python ${KERNEL_VERSION}"

LABEL \
  me.ggicci.jupyter.image.created="${arg_image_created}" \
  me.ggicci.jupyter.image.version="${arg_image_version}" \
  me.ggicci.jupyter.image.revision="${arg_image_revision}" \
  me.ggicci.jupyter.image.authors="Ggicci <ggicci.t@gmail.com>" \
  me.ggicci.jupyter.image.url="https://images.ggicci.me/ggicci/jupyter" \
  me.ggicci.jupyter.image.documentation="https://github.com/ggicci/jupyter" \
  me.ggicci.jupyter.image.source="https://github.com/ggicci/jupyter" \
  me.ggicci.jupyter.image.vendor="GGICCI.ME" \
  me.ggicci.jupyter.image.licenses="MIT" \
  me.ggicci.jupyter.image.title="Jupyter Lab" \
  me.ggicci.jupyter.image.description="Jupyter lab service"


ENTRYPOINT [ "jupyter" ]

