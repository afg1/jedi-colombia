# jedi-colombia
Repository of code used for the JEDI workshop in Colombia, 11-15 Feb 2019


## Workshop overview:

In this workshop, we will develop an image based data mining pipeline, from image registration through to binary and continuous image based data mining. 

We will be using two widely used image registration packages - NiftyReg and Elastix - to register images of ~100 head and neck cancer patients into a common frame of reference. After the registration, we will use image based data mining techniques to look at the relationship between radiotherapy dose and outcome in these patients.

### The data
The data we will be using has come from The Cancer Imaging Archive. I have converted the radiotherapy planning CT volumes to Niftii format to make handling them easier. We also have the corresponding dose distribution delivered to the patients, and some outcome data including feeding tube insertion, weight loss and overall survival.

### The analysis
We will be using a standard image based data mining approach developed in this paper, and used by our group in this paper. In this approach, we choose a reference patient and non-rigidly register all other patients in our dataset to that patient. After this, the registration is used to map the dose distributions into a common frame of reference. 

At this point we perform image based data mining, in which we correlate the dose in each voxel with an outcome of the patient. Depending on the outcome, the technique used may be binary (we will use Student's t-test) or continuous (using, for example Pearson correlation). To begin with, we will use binary outcomes, but given good progress and sufficient time, we may progress to continous outcomes.
