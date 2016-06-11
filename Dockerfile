FROM ubuntu
MAINTAINER Hisaharu Ishii <hisaharu@gmail.com>
WORKDIR /root
EXPOSE 22
CMD /sshd.sh
ADD sshd.sh /sshd.sh
ENV PATH ${PATH}:${HOME}/.cabal/bin
RUN : \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
      openssh-server \
      ca-certificates \
      git \
      make \
      python \
      haskell-platform \
      libncurses-dev \
 && git clone https://github.com/ryuichiueda/ShellGeiData \
 && git clone https://github.com/usp-engineers-community/Open-usp-Tukubai \
 && git clone https://github.com/greymd/egzact.git \
 && ( cd Open-usp-Tukubai \
      && make install \
    ) \
 && cabal update
 && cabal install egison egison-tutorial \
 && ( cd egzact \
      && make install \
    ) \
 && :
