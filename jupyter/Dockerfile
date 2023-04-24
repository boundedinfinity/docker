# https://docs.jupyter.org/en/latest/index.html
# https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html
# https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-base-notebook
# https://jupyterlab.readthedocs.io/en/stable/user/extensions.html#enabling-and-disabling-extensions
# https://github.com/jupyter/docker-stacks
# https://pypi.org/project/bash_kernel/

FROM jupyter/base-notebook

###########################################
#   Switch to root
###########################################

USER root

COPY ./etc/profile.d /etc/profile.d
RUN chmod 0644 /etc/profile.d/*
ENV XDG_DATA_HOME=$HOME/.config

###########################################
#   Provision Docker
###########################################

# https://docs.docker.com/engine/install/ubuntu/#set-up-the-repository
RUN apt-get update \
    &&  apt-get install --yes ca-certificates curl gnupg lsb-release \
    && install -m 0755 -d /etc/apt/keyrings \
    && curl --fail --silent --show-error --location https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor --output /etc/apt/keyrings/docker.gpg \
    && chmod a+r /etc/apt/keyrings/docker.gpg \
    && echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | tee /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && apt-get install --yes docker-ce-cli

# https://docs.docker.com/engine/install/linux-postinstall/
RUN groupadd docker \
    && usermod --append --group docker ${NB_USER} \
    && newgrp docker

###########################################
#   Install Utilities
###########################################

RUN apt-get update && apt-get install --yes \
    less fish pass gnupg pinentry-curses pwgen bash-completion vim gettext \
    iputils-ping jq dotenv

###########################################
#   Provision Vault
###########################################

# https://www.hashicorp.com/official-packaging-guide
RUN apt-get update \
    &&  apt-get install --yes gpg lsb-release zip \
    && install -m 0755 -d /etc/apt/keyrings \
    && curl --fail --silent --show-error --location https://apt.releases.hashicorp.com/gpg | gpg --dearmor --output /etc/apt/keyrings/hashicorp.gpg \
    && chmod a+r /etc/apt/keyrings/hashicorp.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/hashicorp.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list \
    && apt-get update \
    && apt-get install --yes vault \
    && wget https://releases.hashicorp.com/vault/1.13.1/vault_1.13.1_linux_amd64.zip -O /tmp/vault_1.13.1_linux_amd64.zip \
    && rm -rf /usr/bin/vault \
    && unzip /tmp/vault_1.13.1_linux_amd64.zip -d /usr/bin \
    && chmod 755 /usr/bin/vault \
    && rm -rf /tmp/vault_1.13.1_linux_amd64.zip

###########################################
#   GPG configuration
#   All gpg-agent run on a bind mounted volume
#   For some reason can't create a socket on a bind
#   mounted volume and I couldn't find a way
#   to configure a socket location outside of the
#   $GNUGPHOME variable
###########################################

RUN mkdir -p /run/user/${NB_UID} \
    && chown ${NB_UID} /run/user/${NB_UID}

###########################################
#   Switch to normal user
###########################################

USER ${NB_UID}
RUN newgrp docker

###########################################
#   Provision Jupyter
###########################################

# https://jupyterlab.readthedocs.io/en/stable/user/announcements.html#configuration
RUN jupyter labextension disable "@jupyterlab/apputils-extension:announcements"

# https://jupyter-docker-stacks.readthedocs.io/en/latest/using/recipes.html#using-mamba-install-or-pip-install-in-a-child-docker-image
# https://github.com/QuantStack/jupyterlab-drawio
# https://github.com/takluyver/bash_kernel
RUN mamba install --yes --channel conda-forge bash_kernel webcolors uri-template isoduration fqdn rise jupyterlab-drawio && \
    mamba clean --all --force-pkgs-dirs --yes && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

ENV HOST_DIR /host
