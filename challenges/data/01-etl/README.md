# 01-etl

`source_data/` contains 3 json files representing changes to the membership of an infrastructure team over time as exported by a 3rd party system. We already have a PostgreSQL database where we store other employee info, and want to track the infrastructure team membership there too. Unfortunately, the 3rd party system can only export team membership at given points of time, and does not have a way to notify on data update, or allow partial updates.

Complete `script.sh` so that it:
- extracts the team membership data in `source_data/`
- transforms `infrastructure` to `devops` team name to match our DB's schema
- loads the PostgreSQL DB's existing `team_history` table of the `employees` database with the team membership data


## Resources

### ETL

- https://databricks.com/glossary/extract-transform-load

## Test your work

```
bats test.bats
```
