# Hero Api

This is a backend project made by Ruby On Rails. It provides all data belonging to `Hero`, `Power` and its joining table `Hero_Power`

## Ruby version

- Ruby 2.7.4

## Dependencies

- Faker
- Active_model_serializers
- sqlite3
- Rake

## How to run

To be able to use it, you will need to clone it into your machine using the following command.

    git clone git@github.com:Iank-code/Hero-api.git
    cd Hero-api
    bundle install
    rails db:migrate db:seed
    rails s

This will also start the server which will listen on port 3000

```
http://127.0.0.1:3000
```

## Routes

## Endpoint for Hero

GET

    /heros

Returns all heros

GET

    /heros/:id

Return the specific `Hero` you want with its associated powers.
The output will be similar to this

        {
        "id": 1,
        "name": "Ian",
        "super_name": "Flash",
        "powers": [
            {
            "id": 1,
            "name": "Speed",
            "description": "I am the fastest human to ever live"
            }
        ]
        }

If the `Hero` does not exist, it returns the following JSON data, along with
the appropriate HTTP status code:

    {
    "error": "Hero not found"
    }

DELETE

    /heros/:id

Deletes the specified `Hero` and its associated `Power`

## Endpoint for Power

GET

    /powers

Return all the powers.

Get

    /powers/:id

This returns a specific `power`. The output structure should be similar to this;

        {
        "id": 1,
        "name": "Speed",
        "description": "I am the fastest human to ever live"
        }

If the `Power` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```
{
  "error": "Power not found"
}
```

PATCH

    /powers/:id

This route updates an existing `Power`. It accepts an object with
the following properties in the body of the request:

    {
    "name": "updated power name",
    "description": "Updated description"
    }

If the process is successful, it will return a status code of `200`
If the `Power` does not exist, return the following JSON data, along with status code of `404`:

```
{
  "error": "Power not found"
}
```

If the `Power` is **not** updated successfully (does not pass validations),
it returns a json data referring to the validation errors, along with status code of `200`:

DELETE

    /powers/:id

Deletes the specified power

## Endpoint for HeroPowers

POST

    /hero_powers

This route creates a new **HeroPower** that is associated with an
existing `Power` and `Hero`. It accepts an object with the following properties;

    {
    "strength": 2,
    "power_id": 1,
    "hero_id": 3
    }

The `strength` key is anumber by default. Each number represents either `[:STRONG, :WEAK, :AVERAGE]`. **STRONG** is represented by number 0, **WEAK** is represented by number 1, **AVERAGE** is represented by number 2.

If the `HeroPower` is created successfully, send back a response with the data
related to the `Hero` in the format below

    {
    "id": 5,
    "name": "Brandee Lynch",
    "super_name": "Cable",
    "powers": [
        {
        "id": 3,
        "name": "Hypnokinesis",
        "description": "Perferendis maiores earum. Rerum ipsa voluptatem. Vero necessitatibus incidunt.",
        "created_at": "2023-03-25T04:50:29.654Z",
        "updated_at": "2023-03-25T04:50:29.654Z"
        }
    ]
    }

If the `HeroPower` is **not** created successfully, it returns a json data referring to the validation errors with the status code

## LICENCE

This project is licensed under the MIT license.


