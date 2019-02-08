#!/bin/bash

sudo apt-get install texlive-extra-utils

for FILE in ./*.pdf; do
  pdfcrop "${FILE}" "${FILE}"
done
