##############
# Base Image #
##############

FROM rtvu/docker-ubuntu

########################
# Setup User Workspace #
########################

RUN \
  mkdir ${HOME}/workspace && \
  git config --global --add safe.directory ${HOME}/workspace

###########
# Startup #
###########

WORKDIR ${HOME}/workspace

CMD ["/bin/bash"]
