#!/bin/bash

# not nice but works
# coded this on a plane, couldn't google better solutions
function build {
  SPLIT=$(grep -n PHOTOS < index.html.template | cut -d : -f 1)
  awk "NR<$SPLIT {print}" < index.html.template
  for photo in $(find ./photos -name '*.jpg'); do
    echo "      <section data-background=\"$photo\"></section>"
  done
  awk "NR>$SPLIT {print}" < index.html.template
}

build > index.html
