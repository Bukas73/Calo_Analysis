#!/bin/bash

mkdir jobHome

mv ilcsoft_Calo.sh jobHome 
mv sim_steer_muonGun_MuColl_v1.py jobHome
mv reco_steer_BIB_v2.xml jobHome
mv NewData2.hepmc jobHome
mv lctuple_steer.xml jobHome
mv Pandora* jobHome

WORKDIR=`pwd`/jobHome

singularity exec -B /cvmfs --contain --home=$WORKDIR --workdir=$WORKDIR /cvmfs/cms.hep.wisc.edu/mucol/reference/mucoll_1.6_v02-07MC.sif /bin/bash ilcsoft_Calo.sh $*

mv jobHome/*.out .
mv jobHome/*.root .
mv jobHome/*.slcio .
### clean dir

rm -rf jobHome

