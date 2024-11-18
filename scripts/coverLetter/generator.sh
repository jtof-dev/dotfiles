#!/bin/bash

internship=$(jq -r '.internship' "data.json")
company=$(jq -r '.company' "data.json")

sed "s/{{internship}}/${internship}/g; s/{{company}}/${company}/g" "input/coverLetter.md" >"input/tmp.md"

pandoc "input/tmp.md" -o "output/coverLetter.pdf" -V geometry:margin=1in -V parskip=1.25 -V pagestyle=empty

pdfunite "output/coverLetter.pdf" "input/resume.pdf" "output/${company} resume.pdf"
