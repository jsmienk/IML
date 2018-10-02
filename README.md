# IML: Number recognition assignment

    Marnick van der Arend (415010) 
    Jeroen Smienk (422516)

    Date: 2-10-2018

## Introduction

Goal of the project is to write a digit recognizer using SimpleCV and ScikitLearn. This project works with a docker container in which the following libraries are installed: Python 2.7, Jupyter Notebook, SimpleCV, NumPy, Pandas, SciKitLearn and Matplotlib. 

## Observations of the given dataset
- Every image has a size of 128x32 pixels
- The filename of the image describes the labels of the digits in the image
- There are 4 digits in an image
- Every digit has a size of 32x32 pixels
- Every image has a different brightness (light, normal, dark)

## Approach

### Feature extraction (25%)

#### Digit extraction steps

1. Preprosessing files by reading them from a directory. Extracting the filename and the image and placing them as a tuple (label, Image) in an array.
2. Modifying the Image by using binarize, erode and dilate
3. Splitting the image into four 32x32 pixel parts, each containing only one digit

#### Feature extraction

For using machine learning we need specific features of every digit. That is why we are going to use different feature metrics so we can train the machine. We are going to extract the following features:

1. Area
2. Number of holes (Contour)
3. Width
4. Height
5. Centroid
6. Circle distance
7. Rectangle distance
8. Angle
9. Radius
10. Hull radius

### Feature analysis (20%)

- Complete analysis of all of your features (including statistics, tables and graphs
- Usage of feature selection algorithms from the Scikit-learn library
- Usage of Principal Component Analysis (PCA)

### Preprocessing (15%)

- Several preprocessing techniques such as one-hot-encoding, normalization, scaling and standardization

### Training/testing (30%)

- Usage of several model selection algorithms (e.g. crossvalidation and KFold)
- Usage of the classification algorithms that have been explained during this course, including experiments with hyper parameter values
- Two additional classification algorithms. Also provide some theoretical explanation of those algorithms in your notebooks
- Usage of GridSearch, ParameterGrid and pipeline to tweak the hyper parameters
- Comparison of the result of the different classifiers with the different hyper parameter values with observations and a conclusion
- An export of your best classifier

### Implementation (10%)

- Simple program in which a user can upload/select an image and the program will show the zipcode of the image
- Usage of Jupyter widget controls


# Installation guide

## Installation and starting the container

### Before installing the container
Before installing and running the container it is important to perform the following steps:
1. Install docker on your platform.
2. IMPORTANT: if you are running on Windows, add the drive on which this folder is situated as shared drive in the docker settings.

### Preferred way: Installation and starting with provided scripts
Linux/Mac users:
- Give the shell scripts execution rights: ```chmod +x ./shell-scripts/*.sh```
- Install the docker container by running: ```./shell-scripts/install.sh```
- Start the docker container with Jupyter server: ```./shell-scripts/start.sh```

Windows users:
- Install the docker container by running ```./shell-scripts/install.bat```
- Start the docker container with Jupyter server ```./shell-scripts/start.bat```

### Manual installation from docker hub (in case the scripts don't work)
The following steps can also be executed by running the shell/bat scripts in the shell-scripts folder
1. Install docker and download the image using the command ```docker pull evertduipmans/saxion-adt``` (install.sh script)
2. Start the container with the start script (sh or bat file)

### Manual install (in case docker hub does not work)
1. Install docker and go to the docker-files folder. Execute the following command on the shell to setup the virtual environment
   ```sudo docker build -t="saxion-iml" .```

2. Startup the docker container (on linux/mac):
   ```docker run -p 8888:8888 -v "$(pwd)":/assignment -it saxion-iml:latest``` (start.sh)

3. Open your webbrowser and go to: [http://localhost:8888](http://localhost:8888) and check if the notebook works. The password is iml.

4. Test one of the demo scripts (in notebooks/examples)

### Killing the container
Sometimes the docker terminal becomes unresponsive when certain SimpleCV operations are executed. We have supplied a ```kill.sh``` script that can be used to kill the container (only provided for Linux/Mac). 

If you want to kill the container manually:
1. Execute ```docker ps``` and copy the container id of your container
2. Execute ```docker kill CONTAINERID``` where CONTAINERID is the id of your container

## Folders
This folder contains the following subfolders:

1. Folder dataset-images: this folder contains all the images that should be processed in your script
2. Folder dataset-numpy: after extracting features from the images, store the created datasets here (hint: use np.save() function for storing numpy arrays as file or use pandas)
3. Folder classifier: after the training/testing phase, you can export the (best) trained model to a file (hint: use joblib.dump() function)
4. Folder shell-scripts: contains scripts for installing and starting the docker container
