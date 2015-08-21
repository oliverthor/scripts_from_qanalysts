#!/bin/bash
# Debugging jenkins errors in the morning enforces the user to parse a webpage 
# for test errors/failures, find their directory, then push them into an adhoc
# run to determine repro-rate/product-failure. This script is intended
# (based on name of test file [and eventually taking an *.html file]) to find the
# directory to which its located and generate a list of full test paths (relative 
# to local directory of gaia-ui-tests/

TEST_NAME=$1
GAIA="$HOME/Desktop/oliverthor/git/gaia/tests/python/gaia-ui-tests"
GAIATEST="gaiatest/tests/functional"

function find_test_dir () {
  
  # echo "find_test_dir"
  # echo $GAIA$GAIATEST
  # echo "Looking for: $1"
  cd $GAIA
  #  MANIFEST= grep -R $1 .
  MANIFEST= find $GAIATEST | grep $1 | grep y$
  
  if [ ! -z $MANIFEST ]; then
    echo $MANIFEST
  fi
  
}
for var in "$@"; do
    find_test_dir $var
done
echo "Done"
