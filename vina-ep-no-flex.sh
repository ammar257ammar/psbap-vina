#!/bin/bash

PDB=$1

cd /pdb/${PDB}/proteins

echo "Protein preparation started" > /pdb/${PDB}/receptor-preparation.log
echo "Ligand preparation started" > /pdb/${PDB}/ligand-preparation.log

for f in */; do

	cd ${f%/}

	bash /vina/pdb2pdbqt.sh ${f%/}_final.pdb &>> /pdb/${PDB}/receptor-preparation.log

	cd ../../ligands
	
	for p in *_min.mol2; do

		bash /vina/mol2pdbqt.sh ${p} &>> /pdb/${PDB}/ligand-preparation.log 

		torsionLine=$(head -n 1 ${p%.mol2}.pdbqt)

		cd ../proteins/${f%/}

		echo -e "${f%/}\t${p%.mol2}\t${torsionLine//[!0-9]/} \t $(/usr/bin/time -f \"%e\t%P\" ( /vina/vina --config ${f%/}_config.txt --ligand /pdb/${PDB}/ligands/${p%.mol2}.pdbqt --out vina/${p%_min.mol2}/${p%.mol2}_docking.pdbqt --log vina/${p%_min.mol2}/${p%.mol2}_log.txt --seed $(cat ${f%/}_seed.txt) ) 2>&1 1>/dev/null )" >> /pdb/${PDB}/intensive-docking.log

		cd ../../ligands

	done

	cd ../..
done
