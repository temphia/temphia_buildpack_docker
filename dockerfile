FROM ubuntu:latest

LABEL maintainer="bornjre <bornjre@gmail.com>"

VOLUME ["work", "work"]

RUN apt-get update && apt-get install -y build-essential git curl

RUN git config --global advice.detachedHead false;

RUN git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.11.3; \
    /bin/bash -c 'echo -e "\n\n## Configure ASDF \n. $HOME/.asdf/asdf.sh" >> ~/.bashrc'; \
    /bin/bash -c 'echo -e "\n\n## ASDF Bash Completion: \n. $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc'; \
    exec bash; \
    /bin/bash -c asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git;

COPY entry.sh entry.sh

RUN chmod +x /entry.sh

ENTRYPOINT ["/entry.sh"]

# ENTRYPOINT ["/bin/bash"]