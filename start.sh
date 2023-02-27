#!/usr/bin/env bash

FILE_COUNT=$(find "exotic-standalone/target/" -wholename "exotic-standalone*.jar" | wc -l)

current_path="$(pwd)" ;
cd "${current_path}" ;

#if (( FILE_COUNT == 0 )); then
#  mvn #-DskipTests=true
#fi

ls "${current_path}/exotic-standalone/target/" || exit ;
java -jar "${current_path}/exotic-standalone/target/exotic-standalone-1.11.4-SNAPSHOT.jar" serve
