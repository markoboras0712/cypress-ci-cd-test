#!/bin/bash

# Change to the directory specified as the argument passed in yml file
cd $1

# List all files in the directory, including hidden files
ls -la

# Check if the 'cypress.env.json' file does not exist
if [ ! -f "cypress.env.json" ]; then
    echo "Creating cypress.env.json file"
    
    : '
    Create a new "cypress.env.json" file with the following content:
    OpenSSL's "rand" function generates a random hexadecimal string using,
    and uses it to create a unique email address for testing purposes.
    The email address follows the format "cypress+ci+<random_hex>@gmail.com".
    '

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
fi

# Print the content of the 'cypress.env.json' file
cat cypress.env.json
