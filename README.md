
## graphql-ruby-demo

Shows an implementation of GraphQL via [graphql-ruby](https://github.com/rmosolgo/graphql-ruby).

- Try it on [heroku](http://graphql-ruby-demo.herokuapp.com/).
- Schema is defined in  [`/app/graph`](https://github.com/rmosolgo/graphql-ruby-demo/tree/master/app/graph).
- Queries are served by [`queries#create`](https://github.com/rmosolgo/graphql-ruby-demo/blob/master/app/controllers/queries_controller.rb#L8).
- GraphiQL IDE is served by [graphiql-rails](https://github.com/rmosolgo/graphiql-rails)

### run in development mode

The `docker-compose.yaml` file contains all of the docker config required to build, and run the database, and web containers for this rails app. It also mounts the local development directory onto the container and will reload the application if anything changes.

```bash
# this will build the image (including all gems, and debugging tools like psql)
docker-compose build
# this will start up postgres db, and the web container (PUMA, rails, graphql)
# this will also generate the corresponding migrations
docker-compose up
``` 

### load information into the db

```bash
# seed information into the db by running rake db:seed in the web container
docker-compose exec web rake db:seed
# in other terminal window run the following run bash commands in the web container
# this can be used to install gems, and other stuff
docker-compose exec web
```

### run in production mode

```bash
# build image
docker-compose -f docker-compose.production.yaml build
# run production containers
docker-compose -f docker-compose.production.yaml up 
```

### TODO

* ruby live-reload for development
* add better configurations
