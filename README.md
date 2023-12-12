# LIQUIBASE PROJECT

## About
A simple project to show how to version and manage database changes with liquibase and gradle

  * [Project files and folders](#project-files-and-folders)
  * [Commands](#commands)


## Project files and folders

Types of file:
  - **0000X-DDL.sql :** used for commands that change the structure of a database.
  - **0000X-DML.sql :** used for commands that manipulate data of database.
  - **0000X-SCR.sql :** used for commands that running scripts ( procedures, function and  package creations, pl/sql command)
    
```bash
├── db-scripts/
│       │  
│       ├── R1/
│       │   ├── changelog.yaml  // changelog r1
│       │   ├── 0001-DDL.sql 
│       │   └── 0002-DML.sql
│       │  
│       ├── R2/
│       │   ├── changelog.yaml  // changelog r2  
│       │   ├── 0001-DML.sql
│       │   ├── 0002-SCR.sql 
│       │   ├── 0003-SCR.sql    // an example with multiline scripts ( procedures, functions, packages... )
│       │   └── 0004-SCR.sql    // an example with runOnChange:true
│       │  
│       └── changelog.yaml      // master changelog file
│
├── build.gradle      // task declarations to run liquibase commands           
└── gradle.properties // configuration properties ( connection database, liquibase settings...)   

```

## Commands

All commands bellow can be confirmed with `select * from  SYS.DATABASECHANGELOG` or `gradle liquibaseExec history`

| gradle command | description |
| ---            | ---         | 
| `gradle liquibaseExec validate` | validate pending scripts | 
| `gradle liquibaseExec update` | execute scripts into database | 
| `gradle liquibaseExec updateTestingRollback` |  execute scripts into database and then test rollback commands | 
| `gradle liquibaseExec update -PliquibasePassword=PASS1` |  overriding properties on running (some props are declared in  in [](./gradle.properties) ) |
| `gradle liquibaseExec rollbackCount -PliquibaseCommandValue=10` | rollback last ammounts of changeset command  | 
| `gradle liquibaseExec tag -PliquibaseCommandValue="1.1.0"` | tag last executed changeset  | 
| `gradle liquibaseExec rollback -PliquibaseCommandValue="1.1.0"` | rollback into the last tagged changeset | 
| `gradle liquibaseExec updateTestingRollback -Pcontexts=dev` |  update on specific context |







