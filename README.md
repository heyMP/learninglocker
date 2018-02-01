# Learning Locker v2 Docker Deployment

UNDER DEVELOPMENT.



## Instructions

### Create .env files

You need to create two .env files.  One for `/learninglocker` and one for `xapi-service`. They each have there own .env.example file that has everything set up for testing.

```bash
$ cp ./learninglocker/.env.example ./learninglocker/.env
$ cp ./xapi-service/.env.example ./xapi-service/.env
```

### Start Servers
Start the containers with either `make start` or `make rebuild`.

### Visit Page

Visit the Learning Locker UI at `http://localhost:3000`

## Commands

Start it up!

```
make start
```

To completely remove all containers and volumes. Will not remove images.:

```
make clean
```

Clean up and start:

```
make rebuild
```
