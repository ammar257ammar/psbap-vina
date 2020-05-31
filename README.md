# AutoDock Vina Docker

This repository is part of the "Pocket SNPs effect on protein-ligand Binding Affinity Prediction (PSBAP)" project and it is a submodule of the main repository 

https://github.com/ammar257ammar/pocket-snps-effect-binding-affinity

Please prepare and build the docker using the following instruction and refer back to the previous link for proper usage in the context of PSBAP project.

1. ### First, clone this repository, then follow next! 


### Download AutoDock Vina and related tools

1. Download AutoDock software from the following link

   http://vina.scripps.edu/download/autodock_vina_1_1_2_linux_x86.tgz

2. Move the downloaded "autodock_vina_1_1_2_linux_x86.tgz" file to the cloned repository folder.

3. Download MGLTools 1.5.6 from the URL:

   http://mgltools.scripps.edu/downloads/downloads/tars/releases/REL1.5.6/mgltools_x86_64Linux2_1.5.6.tar.gz

4. Move the downloaded "gz" file to the cloned repository folder. 

5. Go to the cloned repository folder "psbap-vina" with "cd" command and follow the instructions in the next section

### Build the Docker image

docker build -t psbap-vina .

#### Now you are ready! 

#### Go back to [Main Project](https://github.com/ammar257ammar/pocket-snps-effect-binding-affinity) for proper usage of the Docker image.


