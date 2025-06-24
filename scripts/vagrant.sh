#!/bin/bash

ACTION=$1
cd vagrant

case $ACTION in
  up) vagrant up ;;
  down) vagrant destroy -f ;;
  rebuild) vagrant destroy -f && vagrant up ;;
esac
