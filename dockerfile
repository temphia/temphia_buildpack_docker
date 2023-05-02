FROM ubuntu:latest

LABEL maintainer="bornjre <bornjre@gmail.com>"
LABEL org.opencontainers.image.source https://github.com/temphia/temphia_buildpack_docker

VOLUME ["work", "work"]

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y build-essential git curl

RUN git config --global advice.detachedHead false;

RUN git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.11.3 && \
    echo -e "\n\nexport ASDF_DIR=$HOME/.asdf" >> ~/.profile && \
    echo -e "\n\n$HOME/.asdf/asdf.sh" >> ~/.profile && \
    echo -e "\n\n## Configure ASDF \n. $HOME/.asdf/asdf.sh" >> ~/.bashrc && \
    echo -e "\n\n## ASDF Bash Completion: \n. $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc && \
    . $HOME/.asdf/asdf.sh && \
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git && \
    asdf install nodejs latest && \
    asdf global nodejs latest;


RUN $HOME/.asdf/bin/asdf plugin add zig https://github.com/cheetah/asdf-zig.git; \
    $HOME/.asdf/bin/asdf install zig latest; \
    $HOME/.asdf/bin/asdf global zig latest;

COPY entry.sh entry.sh

RUN chmod +x /entry.sh

ENTRYPOINT ["/entry.sh"]

# ENTRYPOINT ["/bin/bash"]