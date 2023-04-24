#!/usr/bin/env bash

sudo mkdir -p /run/user/${NB_UID}
sudo chown ${NB_UID} /run/user/${NB_UID}
ls -la /run/user
