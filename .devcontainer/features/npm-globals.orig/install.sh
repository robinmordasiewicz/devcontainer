#!/bin/bash
set -ex

cat npm_globals.txt | xargs npm install -g
