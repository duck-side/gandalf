#!/usr/bin/env bash

set -e

TIME=$(date -u +"%-H")
DAY=$(date -u +"%u")

if [[ $RESPOND == 'true' ]]; then
  echo "🧙🏻‍♂️ You shall pass"
  echo "true"
  exit 0;
fi

if [[ $RESPOND == 'false' ]]; then
  echo "🧙🏻‍♂️ You shall not pass"
  echo "false"
  exit 0;
fi

if [[ ($TIME -ge $START_HOURS && $TIME -lt $END_HOURS) && ($DAY -ge $START_DAY && $DAY -le $END_DAY) ]]; then
  echo "🧙🏻‍♂️ You shall pass"
  echo "true"
else
  echo "🧙🏻‍♂️ You shall not pass"
  echo "false"
fi