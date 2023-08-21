# Forensic Investigation Into Suspected Malicious Breach of Production Database

## Incident Synopsis

Customers are reporting issues accessing their accounts on the platform. It appears the platform is suffering from a partial outage. Initial investigation finds errors in the API logs reporting issues connecting to the users database.

Further investigation reveals that the database has been deleted. The task in front of us is to understand how this could have happened.


## High Level Platform Overview

For the purposes of this scenario, the platform will focus on the main components related to the incident. The main components are:
- API service
- Postgres Database
- Vault
- Boundary
- AWS S3
- AWS Cloud watch

The API service talks to the Postgres database, using credentials from Vault. Human access to the database is done via Boundary. Boundary streams logs to AWS cloudwatch. Boundary session recordings are stored in an AWS S3 buckets.

# Investigation
