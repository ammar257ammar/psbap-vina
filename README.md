# PSnpBind AutoDock Vina Docker

![GitHub top language](https://img.shields.io/github/languages/top/ammar257ammar/psnpbind-vina) ![GitHub](https://img.shields.io/github/license/ammar257ammar/psnpbind-vina) ![GitHub release (latest by date)](https://img.shields.io/github/v/release/ammar257ammar/psnpbind-vina) [![Dockerhub](https://img.shields.io/badge/Dockerhub-aammar%2Fpsnpbind--vina-green)](https://hub.docker.com/r/aammar/psnpbind-vina) ![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/aammar/psnpbind-vina)

This repository prepares AutoDock Vina (for molecular docking) to be executed against multiple protein-ligand combinations in parallel as part of constructing the PSnpBind database.

This repository is part of the "Pocket SNPs Effect On Protein-Ligand Binding Affinity Project (PSnpBind)" project and it is a needed to reproduce the work as described in the main repository 

https://github.com/ammar257ammar/PSnpBind-Build

Please prepare and build the docker using the following instruction and refer back to the previous link for proper usage in the context of PSnpBind project.

### First, clone this repository.


### Second, download AutoDock Vina and related tools

1. Download AutoDock software from the following link

   http://vina.scripps.edu/download/autodock_vina_1_1_2_linux_x86.tgz

2. Move the downloaded "autodock_vina_1_1_2_linux_x86.tgz" file to the cloned repository folder.

3. Download MGLTools 1.5.6 from the URL:

   http://mgltools.scripps.edu/downloads/downloads/tars/releases/REL1.5.6/mgltools_x86_64Linux2_1.5.6.tar.gz

4. Move the downloaded "gz" file to the cloned repository folder. 

5. Go to the cloned repository folder "psnpbind-vina" with "cd" command and follow the instructions in the next section

### Build the Docker image

docker build -t psnpbind-vina .

#### Now you are ready! 

#### Go back to [Main Project](https://github.com/ammar257ammar/pocket-snps-effect-binding-affinity) for proper usage of the Docker image.


