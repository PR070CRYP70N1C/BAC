#!/bin/sh

# --- Script Build ClamAV --- #

mkdir -p ClamAV/build

cmake -S ClamAV -B ClamAV/build

rm -rf libnull.a
