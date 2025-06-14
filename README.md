# Infra

## usage

### images

* do ``./unpack.sh <cosh_scraper_backend.tar> <cosh_scraper_frontend.tar>`` with files in same folder as script
* do `docker compuse --profile production up --build -d` to run production container else do `development` to run
  development database

### deployment

for deployment the tables and compose file is followed, we deploy via render and have a database on Neon, and Rabbit Mq via cloudamqp.
There are three render applications that are running mainly, these are our [frontend](https://cosh-scraper-frontend-71v0.onrender.com), [backend](https://cosh-scraper-backend.onrender.com) which can be accessed via api calls no login required. And then as last our [websocket server](https://websocketserver-67kr.onrender.com) this one is used to directly communicate to the frontend and give live updates of what is going on, the setup for this server can be found [here](https://github.com/Cosh-eco-Scraper/websocketServer).

### database

The database consists of different tables and datatypes to represent the stores and all attributes needed:

#### Types Table

| Column      | Type        | Nullable | Description                |
|-------------|-------------|----------|----------------------------|
| id          | SERIAL      | No       | Primary Key                |
| name        | VARCHAR(20) | No       |                            |
| description | TEXT        | Yes      |                            |
| created_at  | TIMESTAMP   | No       | Default: CURRENT_TIMESTAMP |
| updated_at  | TIMESTAMP   | No       | Default: CURRENT_TIMESTAMP |

#### Statements Table

| Column     | Type      | Nullable | Description                |
|------------|-----------|----------|----------------------------|
| id         | SERIAL    | No       | Primary Key                |
| statement  | TEXT      | Yes      |                            |
| created_at | TIMESTAMP | No       | Default: CURRENT_TIMESTAMP |
| updated_at | TIMESTAMP | No       | Default: CURRENT_TIMESTAMP |

#### Locations Table

| Column      | Type         | Nullable | Description                |
|-------------|--------------|----------|----------------------------|
| id          | SERIAL       | No       | Primary Key                |
| street      | VARCHAR(255) | No       |                            |
| number      | VARCHAR(50)  | No       |                            |
| postal_code | VARCHAR(20)  | No       |                            |
| city        | VARCHAR(100) | No       |                            |
| country     | VARCHAR(100) | No       |                            |
| created_at  | TIMESTAMP    | No       | Default: CURRENT_TIMESTAMP |
| updated_at  | TIMESTAMP    | No       | Default: CURRENT_TIMESTAMP |

#### Stores Table

| Column      | Type         | Nullable | Description                |
|-------------|--------------|----------|----------------------------|
| id          | SERIAL       | No       | Primary Key                |
| name        | VARCHAR(255) | No       |                            |
| description | TEXT         | Yes      |                            |
| retour      | TEXT         | Yes      |                            |
| location_id | INTEGER      | No       | References: locations      |
| created_at  | TIMESTAMP    | No       | Default: CURRENT_TIMESTAMP |
| updated_at  | TIMESTAMP    | No       | Default: CURRENT_TIMESTAMP |

#### Opening Hours Table

| Column             | Type        | Nullable | Description                |
|--------------------|-------------|----------|----------------------------|
| id                 | SERIAL      | No       | Primary Key                |
| day                | VARCHAR(9)  | No       | Values: Monday-Sunday      |
| openingAt          | VARCHAR(10) | No       |                            |
| closingAt          | VARCHAR(10) | No       |                            |
| openingAtAfterNoon | VARCHAR(10) | Yes      |                            |
| closingAtAfterNoon | VARCHAR(10) | Yes      |                            |
| store_id           | INTEGER     | No       | References: stores         |
| created_at         | TIMESTAMP   | No       | Default: CURRENT_TIMESTAMP |
| updated_at         | TIMESTAMP   | No       | Default: CURRENT_TIMESTAMP |

#### Brands Table

| Column     | Type         | Nullable | Description                |
|------------|--------------|----------|----------------------------|
| id         | SERIAL       | No       | Primary Key                |
| name       | VARCHAR(255) | No       | Unique                     |
| label      | VARCHAR(5)   | Yes      | Max length: 5              |
| created_at | TIMESTAMP    | No       | Default: CURRENT_TIMESTAMP |
| updated_at | TIMESTAMP    | No       | Default: CURRENT_TIMESTAMP |

#### Store Brands Table

| Column     | Type      | Nullable | Description                     |
|------------|-----------|----------|---------------------------------|
| store_id   | INTEGER   | No       | Primary Key, References: stores |
| brand_id   | INTEGER   | No       | Primary Key, References: brands |
| created_at | TIMESTAMP | No       | Default: CURRENT_TIMESTAMP      |

#### Store Types Table

| Column     | Type      | Nullable | Description                     |
|------------|-----------|----------|---------------------------------|
| store_id   | INTEGER   | No       | Primary Key, References: stores |
| type_id    | INTEGER   | No       | Primary Key, References: types  |
| created_at | TIMESTAMP | No       | Default: CURRENT_TIMESTAMP      |

Note: All tables have automatic update triggers for the updated_at column.