#! /bin/bash
#
# The skeleton for this script was taken from Stan Watowich's group at the
# University of Texas Medical Branch
# Requires MGL Tools from Scripps: http://mgltools.scripps.edu/

# --- Customizable variables --------------------------------------------------
MGLTOOLS_LOCATION="/home/apc/MGLTools-1.5.6";
# -----------------------------------------------------------------------------

# --- Utility functions -------------------------------------------------------
function die () { echo "$@" 1>&2 ; exit 1; }

function usage () {
  echo "Usage: pdb2pdbqt.sh proteinFile ligandFile"
  echo "ligandFile should be a mol2 file."
}
# -----------------------------------------------------------------------------


if [ $# -ne 1 ];then
  usage
  exit 0
else

   	ligandFile=$1

   	if [[ ! -f $ligandFile ]];then
	    die "File $ligandFile does not exist."
   	fi
  
  	LIGAND_SCRIPT="$MGLTOOLS_LOCATION/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_ligand4.py";

  	LIGAND_PARAMS="-A bonds_hydrogens ";

  	LIGAND_INFILE="-l $ligandFile";

        ligandPdbqtFile="${ligandFile%.mol2}.pdbqt";
	#die "Error: Could not convert $ligandPdbqtFile .mol2 ligand file into .pdbqt"
        LIGAND_OUTFILE="-o $ligandPdbqtFile";

  	$PYTHON_INTERPRETER $LIGAND_SCRIPT $LIGAND_INFILE $LIGAND_OUTFILE $LIGAND_PARAMS > /dev/null 2> /dev/null

	if [ $? -eq 0 ]; then

	    if [[ ! -f $ligandPdbqtFile ]]; then
	    	die "Error: Could not convert $ligandFile ligand file into .pdbqt"
	    else
		echo "Ligand $ligandFile conversion from MOL2 to PDBQT has finished successfully..."
	    fi

	else
	    die "Error: Could not convert $ligandFile ligand file into .pdbqt"
	fi

fi
