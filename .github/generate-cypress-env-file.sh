#!/bin/bash

# Check if cypress.env.json file exists, if not create it
if [ ! -f "cypress.env.json" ]; then
  cp cypress.env.template.json cypress.env.json
fi

# Fill in userFree credentials with new data
sed -i 's/"email": ""/"email": "cypress+ci-cd+0@gmail.com"/' cypress.env.json
sed -i 's/"password": ""/"password": "123456"/' cypress.env.json
