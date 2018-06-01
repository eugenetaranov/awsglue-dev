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
  "jupyter-custom")
    jt -t grade3 -f roboto -fs 9 -nfs 9 -cellw 95%
    jupyter
    ;;
  "pyspark")
    pyspark
    ;;
  "*")
    echo "usage: jupyter | jupyter-custom | pyspark | bash"
    exit 0
    ;;
esac
