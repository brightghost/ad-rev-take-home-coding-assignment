table names are still singular after changing in code and flyway repair?

    sw-x230:demo swlkr$ docker exec -it adrev-demo-postgres /bin/bash
    root@a4ca200c4533:/# psql -U demo -d demo -c "\dt"
                List of relations
    Schema |         Name          | Type  | Owner 
    --------+-----------------------+-------+-------
    public | conversion            | table | demo
    public | flyway_schema_history | table | demo
    public | touchpoint            | table | demo
    (3 rows)


dropped the tables

    root@a4ca200c4533:/# psql -U demo -d demo -c "DROP TABLE touchpoint CASCADE"
    root@a4ca200c4533:/# psql -U demo -d demo -c "DROP TABLE conversion CASCADE"

flyway repair said nothing to repair
build and run again; tables arent recreated

    root@a4ca200c4533:/# psql -U demo -d demo -c "\dt"
                List of relations
    Schema |         Name          | Type  | Owner 
    --------+-----------------------+-------+-------
    public | flyway_schema_history | table | demo
    (1 row)



guess you need to
    ./mvnw clean flyway:migrate

but it's throwing an err that seems to be reffing an old version of the migration script

ran `mnvnw package` which also recreates the tables; now migrate succeeds and
table names are right

    root@a4ca200c4533:/# psql -U demo -d demo -c "\dt"
                List of relations
    Schema |         Name          | Type  | Owner 
    --------+-----------------------+-------+-------
    public | conversions           | table | demo
    public | flyway_schema_history | table | demo
    public | touchpoints           | table | demo
    (3 rows)