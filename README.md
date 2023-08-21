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

# Investigation Steps

- The first breadcrumb to seek out is the point at which the database became unavailable. According to the logs, the errors started appearing at **10.09**.
- Next we need to ascertain who or what accessed the database in a  10-minute window leading up to the outage, starting at **10.09** and working back in time.
- We first check the change management system to ensure there were no changes performed that may have caused this incident. We identified **a series of schema changes performed around 10.01**.
- We also check the Vault logs to see if any credentials were generated for the database. All database credential access is brokered via Vault. We identify several credentials generated in the window:
  - **09.59 - 
- 