# Database dump

This folder contains a dump of the MongoDB database used in the project. 

## Restoring the database
You can restore it using the following command:

```bash
mongorestore -d pia-project-db /home/pia-project-db
```

This works because the docker-compose file mounts the `mongodb/pia-project-db` folder to the `/home/pia-project-db` folder in the container.

## Backup the database

If you want backup the database, you can use the following command:

```bash
mongodump -d pia-project-db --out /home
```