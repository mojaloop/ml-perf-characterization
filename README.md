# Performance Characterization

## Test Cases

Test Case | Description | Notes
---------|----------|---------
 1 | FSPIOP GetParties End-to-end | FSPIOP GET /parties request executed from K6 via the Account-Lookup-Service

## Test Scenarios

Scenario | Description | Test-Case | Repeatable (Y/N) | Notes
---------|----------|---------|---------|---------
 1 | ALS-bypass Baseline with Sims-only | 1 | Y | C3
 2 | ALS Baseline with Sims-only | 1 | Y | C3
 3 | ALS Baseline with Sims-only, Scale 2 | 1 | Y | C3
 4 | ALS Baseline with Sims-only, Scale 4 | 1 | Y | C3
 5 | ALS Baseline with Sims-only, no logs/audit-events | 1 | Y | C3
 6 | ALS Baseline with Sims-only, HTTP-Keep-Alive enabled | 1 | N | C3
 7 | ALS Baseline with Sims-only, UV_THREADS | 1 | N | C3

### ALS-bypass Baseline with Sims-only

TODO:

- insert diagram here
- insert description and why this test scenario may be useful, etc

## TODO

- add sections for each test-scenario
