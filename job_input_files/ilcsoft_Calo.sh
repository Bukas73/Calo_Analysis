#!/bin/bash

WORKDIR=`pwd`

source /opt/ilcsoft/muonc/init_ilcsoft.sh

#git clone https://github.com/dally96/MuonColSim.git

#cd MuonColSim

#unzip NewData2.hepmc.zip

#cd MuonCutil/SoftCheck

GEO="/opt/ilcsoft/muonc/detector-simulation/geometries/MuColl_v1/MuColl_v1.xml"

ddsim --compactFile ${GEO} --inputFile NewData2.hepmc --steeringFile sim_steer_muonGun_MuColl_v2.py &> $WORKDIR/sim.out 

Marlin --InitDD4hep_mod4.DD4hepXMLFile=${GEO} reco_steer_BIB_v2.xml &> $WORKDIR/reco_2ev.out

Marlin lctuple_steer_v2.xml &> $WORKDIR/ntuple_2ev.out

mv ntuple_tracker.root $WORKDIR/histograms.root 

mv lctuple_tracker.root $WORKDIR/JetHistograms_2ev.root

mv muonGun_sim_MuColl_v1.slcio $WORKDIR/SimHits.slcio 
