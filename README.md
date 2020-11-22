# liquibase-docker-demo

![](https://miro.medium.com/max/491/1*fwQrAHSeYhoQ1xaAjX5sTQ.jpeg)

A **template** for CI/CD using Liquibase, Docker, and Jenkins.

### To build this, type:
```
docker-compose build
```

### To run this, type:
```
docker-compose up -d
  Creating network "liquibase-docker-demo_default" with the default driver
  Creating dbreference ... done
  Creating db          ... done
  Creating liquibase   ... done
```

### To drive this, type:
```
docker exec liquibase liquibase update
```

### To stop this, type:
```
docker-compose down
  Stopping liquibase   ... done
  Stopping db          ... done
  Stopping dbreference ... done
  Removing liquibase   ... done
  Removing db          ... done
  Removing dbreference ... done
  Removing network liquibase-docker-demo_default
```