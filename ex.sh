#!/bin/bash

find ./webapps/ROOT/src -name *.java > sources_list.txt
javac -d ./webapps/ROOT/WEB-INF/classes/ @sources_list.txt
rm -f sources_list.txt
