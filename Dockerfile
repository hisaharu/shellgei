FROM ubuntu
WORKDIR /root
EXPOSE 22
CMD /sshd.sh
ADD sshd.sh /sshd.sh
RUN : \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
      openssh-server \
      ca-certificates \
      git \
      make \
      python \
 && git clone https://github.com/ryuichiueda/ShellGeiData \
 && git clone https://github.com/usp-engineers-community/Open-usp-Tukubai \
 && cd Open-usp-Tukubai \
 && make install \
 && :
