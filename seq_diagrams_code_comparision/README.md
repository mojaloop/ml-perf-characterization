## Below are the differences/suggestions that were identified as part of comparing the code against sequence diagrams.

### Location of Sequence Diagram:
https://docs.mojaloop.io/technical/central-ledger/transfers/1.1.2.a-position-handler-consume.html
### Source code:
https://github.com/mojaloop/central-ledger/blob/master/src/handlers/positions/handler.js
 - The sequence diagram's naming is confusing. 
 - It will be better if we have some in-line comments in the code, as per the sequence diagram to understand the steps?
 - One observation I have is I see Prepare Handler, Position Handler and Fulfil Handler in the main diagram, but there is PreparePositionHandler and FulfilPositionHandler in the detailed flows. 
 - PreparePositionHandler has Prepare Position Handler and Position Handler Consume, but FulfilPositionhandler has only FulfilPositionHandler without any consume part. 
 - My suggestion is to break it down as follows:
    - Position Handler Consume
      - Prepare Position Handler
      - Fulfill Position Handler
 - The code also checks for the presence of transferId in lines 110-115. This is not listed in the validate Event block in the sequence diagram
 - The diagram only checks for position&prepare. But the code also has logic for COMMIT, REJECT, RESERVE
 - Bulk is also being handled in the code, but is not reflected in the sequence diagram. I do not see any separate bulk related sequence diagrams


### Location of Sequence Diagram:
https://docs.mojaloop.io/technical/central-ledger/transfers/1.3.1-prepare-position-handler-consume.html
### Source code:
https://github.com/mojaloop/central-ledger/blob/master/src/models/position/facade.js
 - Step 2 - It would be good to elaborate on what Check 1st transfer means
 - Lines 56-60 in Facade, there is logic with settlement models which is not reflected in the sequence diagram
 - Step 4 has RECEIVED_PREPARE_PROCESSING but I do not see it in the Position Facade code 
 - Step 6 - Error code 2001, I do not see it in the code, is ABORTED_REJECTED 2001 error code?
 - Step 13 - Not able to find settlement model IMMEDIATE. Is that one of the enum values, IMMEDIATE?
 - Step 14 - Refers to NEED TO UPDATE IN CODE
 - Step 15 - Code has TODO 
 - Step 17 - Sequence diagram says transferStateChange which I assumed is a table based on previous notation. But that is not the table that is being referred to. Probably the comments needs to be updated.
 - Step 20 - Code returns prepareMessages instead of transferIds
 - Step 22 - Code has the state as ABORT but sequence diagram has it as ABORTED (very minor differernce). Also I do not see the reason, “NDC exceeded” getting inserted into the database.
 - Step 25 - Not sure if line 216 in position handler is implementing this step - Need to check with developers
