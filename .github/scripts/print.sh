#!/bin/bash

cd $1
ls -la

if [ ! -f "cypress.env.json" ]; then
  echo "Creating cypress.env.json file"
  echo '{}' > cypress.env.json
else
  echo "Cypress.env.json already exists"
fi

cat cypress.env.json
