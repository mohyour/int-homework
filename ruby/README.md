## Suggestions

- Adding user and password detail in env file is a vulnerability. The best thing is to persist users in
the database and store the password as hashed value. This will also allow more users to interact with the app.
- More database constraints should be included to ensure data integrity
- The delete endpoints for article and author uses a wrong http verb - `get`. This should be changed to `delete`. Didn't change that because that will involve making change to the spec to correct the verb. Changing anything in the spec folder is against the instruction
- A database.yml file can be created in the config folder to allow for database configuration for different environments. This file will then be loaded to provide values for `db_config``. That way, running the test doesn't clear the development database.