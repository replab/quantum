#!/bin/bash -l

# This script builds the sphinx documentation

echo "Executing entrypoint.sh"

echo argument=$1

pwd
ls -al

git rev-parse HEAD

# Prepare doc folder and install python requirements
ls -al docs
pip3 install -r sphinx/requirements.txt

# prepare commands
ADDPATH_COMMAND="path, add_replab_path; path, replab_init('verbose', 2);"
GENERATE_COMMAND="exit(~replab_quantum_generate('sphinx'));";
echo "ADDPATH_COMMAND=$ADDPATH_COMMAND";
echo "GENERATE_COMMAND=$GENERATE_COMMAND";

# Check what octave packages we have installed
octave -q --eval "ver"

# Check that octave can access java
octave --eval "b = javaMethod('valueOf', 'java.math.BigInteger', 2)"

# Check just Octave paths
pwd
ls -al
octave --eval "$ADDPATH_COMMAND"
octave --eval "path"
octave --eval "$ADDPATH_COMMAND path"

# Run commands
if octave -q --eval "$ADDPATH_COMMAND $GENERATE_COMMAND"; then
  # Check where we ended up and what's going on where we are
  pwd
  ls -alh docs
else
  # The commands failed
  exit 1
fi
