#!/usr/bin/env bash

set -e

TIME=$(date -u +"%-H")
DAY=$(date -u +"%u")

if [[ $RESPOND == 'true' ]]; then
  echo "true"
  exit 0;
fi

if [[ $RESPOND == 'false' ]]; then
  echo "false"
  exit 0;
fi

if [[ ($TIME -ge $START_HOURS && $TIME -lt $END_HOURS) && ($DAY -ge $START_DAY && $DAY -le $END_DAY) ]]; then
  echo "true"
else
  echo "false"
fi