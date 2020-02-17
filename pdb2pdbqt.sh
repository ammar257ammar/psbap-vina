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
  echo "Usage: pdb2pdbqt.sh proteinFile"
  echo "proteinFile should either be a pdb or pdbqt file."
}
# -----------------------------------------------------------------------------


if [ $# -ne 1 ];then
  usage
  exit 0
else
  proteinFile=$1
  
  # If no protein file is present, die.
  if [[ ! -f $proteinFile ]];then
    die "File $proteinFile does not exist."
  fi
  
  # check the file extension
  IS_PDB=false;
  IS_PDBQT=false;
  if [[ ${proteinFile##*.} == pdb ]];then
    IS_PDB=true;
  elif [[ ${proteinFile##*.} == pdbqt ]];then
    IS_PDBQT=true;
  fi

  if [[ $IS_PDBQT != true ]]; then
    	
    # The next line removes all HETATMs, which I can only guess is intended to
    # delete a ligand if there happens to be one in the file. Be sure that your
    # protein does not contain atoms errantly marked as a HETATM.
    sed -i '/^HETATM/d' $proteinFile
  
  	PYTHON_INTERPRETER="$MGLTOOLS_LOCATION/bin/pythonsh";

  	RECEPTOR_SCRIPT="$MGLTOOLS_LOCATION/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_receptor4.py";

  	PARAMS="-A hydrogens_bonds -U nphs_lps_waters_nonstdres";

  	INFILE="-r $proteinFile";

        pdbqtFile="$(basename $proteinFile .pdb).pdbqt";

  	OUTFILE="-o $pdbqtFile";

  
  	$PYTHON_INTERPRETER $RECEPTOR_SCRIPT $INFILE $OUTFILE $PARAMS > /dev/null 2> /dev/null

	if [ $? -eq 0 ]; then

	    if [[ ! -f $pdbqtFile ]]; then
	    	die "Error: Could not convert $proteinFile ligand file into .pdbqt"
	    else
		echo "Protein $proteinFile conversion from PDB to PDBQT has finished successfully..."
	    fi

	else
	    die "Error: Could not convert $proteinFile protein file into .pdbqt"
	fi

  fi
fi
