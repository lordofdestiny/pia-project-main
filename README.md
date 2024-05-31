# pia-project 

This is project unifies the repositories of the PIA project. 
It contains the following repositories:
- [pia-project-frontend](https://github.com/lordofdestiny/pia-project-frontend) - The frontend of the PIA project in Angular 14.
- [pia-project-backend](https://github.com/lordofdestiny/pia-project-backend) - The backend of the PIA project with Express.js and Mongoose.

It creates a docker image for the server, and docker compose file to run the server and the database together.

## Restoring the example database
This project contains an example database backup that can be restored to the mongo database. 
The database backup is located in the `/mogodb/pia-project-db` folder, and this folder is 
mounted to the `/home/pia-project-db` folder in the `mongo-db` container. w

To restore the example database, you need to run the following command inside the `mongo-db` container:
```bash
mongorestore --db pia-project-db /home/pia-project-db
```

Or from the host machine:
```bash
docker exec -it house-medica-mongo-db-1 mongorestore --db pia-project-db /home/pia-project-db
```
