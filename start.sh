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
    jt -t grade3 -cellw 85%
    jupyter
    ;;
  "pyspark")
    pyspark
    ;;
  "usage")
    echo "usage: jupyter| pyspark | bash"
    exit 0
    ;;
  *)
    pyspark
    ;;
esac
