#!/bin/bash

cd $1
ls -la
if [ -f "cypress.env.json" ]; then
  echo "Creating cypress.env.json file"
  echo '{
    "userFree": {
      "email": "cypress+ci+'$(openssl rand -hex 4)'@gmail.com",
      "password": "123456"
    },
    "userPaid": {
      "email": "cypress+48@test.test",
      "password": "suncica"
    },
    "userRelease": {
      "email": "cypress+40@test.test",
      "password": "suncica"
    }
  }' > cypress.env.json
else
  echo "Cypress.env.json already exists"
  # cat cypress.env.json
fi
