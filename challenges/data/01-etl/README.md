# 01-etl

`source_data/` contains 3 json files representing changes to the membership of an infrastructure team over time as exported by a 3rd party system. We already have a PostgreSQL database where we store other employee info, and want to track the infrastructure team membership there too. Unfortunately, the 3rd party system can only export team membership at given points of time, and does not have a way to notify on data update, or allow partial updates.

- extract the team membership data in `sourcce_data/`
- transform it to match our DB's schema
- load the PostgreSQL DB with the team membership data

## Resources

### ETL

- https://databricks.com/glossary/extract-transform-load

## Test your work

```
bats test.bats
```
