# Neonatal_Seizure_Detection

This repository contains Matlab code for automated seizure detection for neonatal EEG. 

## Algorithms

Neonatal seizure detection algorithms:

SDA - Reference [1] 

SDA_mDB - Reference [1,2,3]

SDA_T - Reference [1,4]

SDA_DB - Reference [1,3]


## EEG file format

EDF format (European Data Format)

see https://www.edfplus.info/specs/edf.html

or

MATLAB formatted data

## Prerequisites

Matlab 2017a

## Description 

This repository contains the Matlab code associated with our recent publication [1]. It contains several algorithms for the detection of neonatal seizure from the EEG. It also contains methods of comparing the algorithm output to the annotation of the EEG by the human experts. For details on the 

## Other

Description of the algorithm and prerequisites in more detail can be found in SDA.pdf 

The core file for the neonatal seizure detection is neonatal_seizure_detection.m

Files are currently not optimised for efficient processing. Future releases will significantly speed up the runtime.

SVM model files for the three algorithms are available at DOI: 10.5281/zenodo.1281146


## Built With

Matlab 2017a

## Authors

Karoliina Tapani and Nathan Stevenson

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## References

[1] K. Tapani, N. Stevenson and S. Vanhatalo, Time-varying EEG correlations improve neonatal seizure detection (In Press)

[2] K. Tapani, S. Vanhatalo and N. Stevenson, Incorpo-rating spike correlations into an SVM-based neonatalseizure detector,EMBEC,652017, pp. 322–325.

[3] W.   Deburchgraeve,   P.   Cherian,   M.   De   Vos,R.  Swarte,  J.  Blok,  G.  Visser,  P.  Govaert  andS.  Van  Huffel,  Automated  neonatal  seizure  detec-tion mimicking a human observer reading EEG,ClinNeurophysiol119(11) (2008) 2447–2454.

[4] A. Temko, E. Thomas, W. Marnane, G. Lightbodyand G. Boylan, EEG-based neonatal seizure detec-tion with support vector machines,Clin Neurophys-iol122(3) (2011) 464–473.

## Contact

Karoliina Tapani

Aalto University School of Science

email: karoliina.tapani@aalto.fi

or

Nathan Stevenson

University of Helsinki
QIMR Berghofer Medical Research Institute

email: nathan.stevenson@helsinki.fi

