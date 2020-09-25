## Code Status

[![CircleCI](https://circleci.com/gh/tanngoc93/coupon-backend.svg?style=shield)](https://circleci.com/gh/tanngoc93/coupon-backend/tree/master) [![codecov](https://codecov.io/gh/tanngoc93/coupon-backend/branch/master/graph/badge.svg)](https://codecov.io/gh/tanngoc93/coupon-backend)

## Coupon API for TheDogPaws.com/Coupons

The application allows adminstrators to create new promotional codes with the start and end time of the campaign. After that the system puts promotion codes into the app's schedule. The application will automationcally manage the status of the promotion code([**:upcoming**, **:currently_active**, **:expired**]).

### Prerequisites

MySQL

Redis server

Node version: 10.x

Ruby version: 2.6.x

Rails version: 5.2.x

Docker/Docker Compose(Optional)

## Please set your ENVs

```html
RAILS_MAX_THREADS [optional]
DB_PORT [required]
DB_HOST [required]
DB_USER [required]
DB_PASSWORD [required]
DB_FOR_DEV [required if you are in DEV env]
DB_FOR_TEST [required if you are in DEV env]
DB_FOR_PROD [required if you are in PROD env]
REDIS_HOST [required]
RAILS_ENV [required]
RACK_ENV [optional]
```


## Built with

* [Rails](https://rubyonrails.org/) - API for coupon service
* [WordPress](https://wordpress.org/) - API for blog service
* [NextJS](https://nextjs.org/) - The React Framework for server side rendering
* [Redux Saga](https://redux-saga.js.org/) - The library that aims to make application side effects
* [Passenger](https://www.phusionpassenger.com/) - Passenger is a web application server
* [Traefik](https://containo.us/traefik/) - Traefik is an open-source Edge Router that makes publishing your services a fun and easy experience
* [Docker](https://docs.docker.com/) - That use OS-level virtualization to deliver software in packages called containers
* [Docker Swarm](https://docs.docker.com/engine/swarm/) - Cluster management integrated with Docker Engine
* [Cloudflare](https://www.cloudflare.com/) - CDN services, DDoS mitigation, Internet security and distributed domain name server
* [CircleCI](https://circleci.com/) - Continuous Integration and Delivery

## Authors

* **Ngoc Nguyen Tan** - *Individual project* - [NgocNT](https://github.com/tanngoc93)
