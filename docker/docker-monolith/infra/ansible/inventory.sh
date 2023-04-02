#! /bin/bash

appserver=$(yc compute instances list | grep "reddit-app" | awk '{print $10}')

if [ "$1" == "--list" ]; then

echo "all:"
echo "  hosts:"
echo "    $appserver:"

else
  echo "{}"
fi
