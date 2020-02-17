#! /bin/bash

MGLTOOLS_LOCATION="/home/apc/MGLTools-1.5.6";


LIGAND_SCRIPT="$MGLTOOLS_LOCATION/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_flexreceptor4.py";

LIGAND_PARAMS="-r $1 -s $2 -g $3 -x $4 ";


$PYTHON_INTERPRETER $LIGAND_SCRIPT $LIGAND_PARAMS 



if [ $? -eq 0 ]; then

    if [[ ! -f $3 ]]; then
    	die "Error: Could not create $3"
    elif [[ ! -f $4 ]]; then
	echo "could not create $4"
    else
	echo "Flexible receptor $1 operation finished succesfully ..."
    fi

else
    die "Error: Could not convert $1 protein file into .pdbqt"
fi
