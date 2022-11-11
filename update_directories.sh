#!/bin/sh

awk -v q="'" '$1 {print "alias", $1" =", q "cd " $2 q}' directories > directoriesrc
