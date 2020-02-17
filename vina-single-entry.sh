#!/bin/bash

PDB=$1
PROTEIN=$2
LIGAND=$3

torsionLine=$(head -n 1 /pdb/${PDB}/ligands/${LIGAND}.pdbqt)

echo -e "${PROTEIN}\t${LIGAND%_min}\t${torsionLine//[!0-9]/} \t $(/usr/bin/time -f "%e\t%P" /vina/vina --config /pdb/${PDB}/proteins/${PROTEIN}/${PROTEIN}_config.txt --receptor /pdb/${PDB}/proteins/${PROTEIN}/${PROTEIN}_final.pdbqt --ligand /pdb/${PDB}/ligands/${LIGAND}.pdbqt --out /pdb/${PDB}/proteins/${PROTEIN}/vina/${LIGAND%_min}/${LIGAND}_docking.pdbqt --log /pdb/${PDB}/proteins/${PROTEIN}/vina/${LIGAND%_min}/${LIGAND}_log.txt --seed $(cat /pdb/${PDB}/proteins/${PROTEIN}/${PROTEIN}_seed.txt) 2>&1 1>/dev/null )"

		
