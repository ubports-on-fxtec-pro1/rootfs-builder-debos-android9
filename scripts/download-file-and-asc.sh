#!/bin/sh

wget "$1" -P "$2"
wget "$1.asc" -P "$2"
