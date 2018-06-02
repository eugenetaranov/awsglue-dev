#!/bin/bash
set -e

function pyspark {
  /opt/spark/bin/pyspark --py-files /PyGlue.zip
}

function jupyter {
  jupyter-notebook  --ip="*" --allow-root
}

case "$1" in
  "jupyter")
    jupyter
    ;;
  "pyspark")
    pyspark
    ;;
esac
