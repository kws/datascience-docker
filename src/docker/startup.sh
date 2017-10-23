#!/bin/bash

# Parse options
while getopts ":s" opt; do
  case ${opt} in
    s ) # process option s - save content
	  SAVECONTENT="enable"
      ;;
    \? ) echo "Usage: cmd [-s]"
      ;;
  esac
done
shift $((OPTIND -1))

# Configure jupyter startup directories
mkdir "$HOME/.jupyter/"
touch "$HOME/.jupyter/jupyter_notebook_config.py"

# Add the pre-save hook
if [ "$SAVECONTENT" == "enable" ]; then
	echo "Saving of notebook output enabled"
else
	echo "Disabling saving of notebook output"
	cat "$HOME/scripts/jupyter-config-strip-content" >> "$HOME/.jupyter/jupyter_notebook_config.py"
fi

# Start notebook
gosu jupyter /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip=* --port=8888 --no-browser

