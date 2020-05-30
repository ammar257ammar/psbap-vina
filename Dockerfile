# ubuntu 18 tags docker: 18.04, bionic-20191029, bionic, latest
FROM        ubuntu:bionic-20191029
MAINTAINER  ammar257ammar@gmail.com

USER root

RUN         apt-get update \
                && apt-get install -yq \
                    time \
		    software-properties-common \
		    wget \
		    openjdk-8-jdk

WORKDIR /vina
COPY autodock_vina_1_1_2_linux_x86.tgz ./
COPY pdb2pdbqt.sh ./
COPY mol2pdbqt.sh ./
COPY vina-single-entry.sh ./
COPY psbap-vina-0.0.1-SNAPSHOT-jar-with-dependencies.jar .

RUN chmod 755 pdb2pdbqt.sh
RUN chmod 755 mol2pdbqt.sh
RUN chmod 755 vina-single-entry.sh
RUN chmod 755 psbap-vina-0.0.1-SNAPSHOT-jar-with-dependencies.jar

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

ENTRYPOINT ["java", "-jar", "/vina/psbap-vina-0.0.1-SNAPSHOT-jar-with-dependencies.jar"]
CMD ["-h"]


