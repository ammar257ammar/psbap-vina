# ubuntu 18 tags docker: 18.04, bionic-20191029, bionic, latest
FROM        ubuntu:bionic-20191029
MAINTAINER  ammar257ammar@gmail.com

USER root

WORKDIR /vina
COPY autodock_vina_1_1_2_linux_x86.tgz ./
COPY pdb2pdbqt.sh ./
COPY mol2pdbqt.sh ./
COPY receptor2flexible.sh ./
COPY vina-ep-no-flex.sh ./

RUN chmod 755 pdb2pdbqt.sh
RUN chmod 755 mol2pdbqt.sh
RUN chmod 755 receptor2flexible.sh
RUN chmod 755 vina-ep-no-flex.sh

RUN tar vxfz autodock_vina_1_1_2_linux_x86.tgz
RUN rm autodock_vina_1_1_2_linux_x86.tgz

WORKDIR /home/apc

COPY MGLTools-1.5.6.tgz ./
RUN tar vxfz MGLTools-1.5.6.tgz
RUN rm MGLTools-1.5.6.tgz

WORKDIR /vina/autodock_vina_1_1_2_linux_x86

RUN mv /vina/autodock_vina_1_1_2_linux_x86/bin/vina /vina/vina && \
    rm -rf /vina/autodock_vina_1_1_2_linux_x86
    
WORKDIR /vina

RUN ls

ENTRYPOINT ["./vina-ep.sh"]



