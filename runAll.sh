#!/bin/bash

PREPARE_SCRIPTS=`ls -1 */prepare.sh`

for f in $PREPARE_SCRIPTS
do
  bash -c $f
done

RUN_SCRIPTS=`ls -1 */run.sh`

for f in $RUN_SCRIPTS
do
  bash -c $f | grep Elapsed
done
