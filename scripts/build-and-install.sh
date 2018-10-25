#!/bin/bash

cd ..

CURRENT_VERSION=$(cat lib/core/constants.rb | grep VERSION | cut -d '"' -f 2)

TO_UPDATE=(
  lib/core/constants.rb
)

gem build krypton.gemspec

gem install krypton-$CURRENT_VERSION.gem