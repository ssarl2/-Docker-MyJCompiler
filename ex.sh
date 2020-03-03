#!/bin/bash

find ./ROOT/src -name *.java > sources_list.txt
javac -d ./ROOT/WEB-INF/classes/ @sources_list.txt
