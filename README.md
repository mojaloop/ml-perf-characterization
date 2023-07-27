# Performance Characterization

## Test Cases

Test Case | Description | Notes
---------|----------|---------
 1 | FSPIOP GetParties End-to-end | FSPIOP GET /parties request executed from K6 via the Account-Lookup-Service

## Test Scenarios

Scenario | Description | Test-Case | Repeatable (Y/N) | Notes
---------|----------|---------|---------|---------
 1 | ALS-bypass Baseline with Sims-only | 1 | Y | .
 2 | ALS Baseline with Sims-only | 1 | Y | .
 3 | ALS Baseline with Sims-only, Scale 2 | 1 | Y | .
 4 | ALS Baseline with Sims-only, Scale 4 | 1 | Y | .
 5 | ALS Baseline with Sims-only, no logs/audit-events | 1 | Y | .
 6 | ALS Baseline with Sims-only, HTTP-Keep-Alive enabled | 1 | N | .
 7 | ALS Baseline with Sims-only, UV_THREADS | 1 | N | .
 8 | ALS Baseline with Sims-only, multiple k6 VUs | 1 | N | .
 9 | ALS Baseline with Sims-only, MySQL in-memory DB | 1 | N | .
 10 | ALS Baseline with Sims-only, Disabled JSON.stringify | 1 | N | [account-lookup-service/pull/460](https://github.com/mojaloop/account-lookup-service/pull/460)
 
### ALS-bypass Baseline with Sims-only

TODO:

- insert diagram here
- insert description and why this test scenario may be useful, etc

### Follow-up stories

#### Account-lookup-Service

- Optimize DFSP Validations - i.e. Add caching to Validation calls for PayerFSP and PayeeFSP on both FSPIOP GET /participant and PUT /participant, or alternatively consider adding a new API operation that is more optimized (i.e. a single API call to validate both PayerFSP & PayeeFSP).
- Profile NodeJS Process on ALS
- Provide configuration to HTTP Agent as part of ALS config (i.e. default.json) that can be overridden.

## TODO

- add sections for each test-scenario
