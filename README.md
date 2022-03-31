# BC API Brain Teaser

This simple app contains an API to store a base64 encoded value into a Blob field.
However, the OnInsertRecord trigger in the API page does not execute.

The question is: **_why_?**

## GET operation

The GET operation to retrieve a list of records looks like:

`GET {{url}}/api/cronus/data/v1.0/companies({{companyId}})/somedata`

## POST operation

The POST operation to create a new record looks like:

```
POST {{url}}/api/cronus/data/v1.0/companies({{companyId}})/somedata
Content-Type: application/json

{
    "data": "SGVsbG8gV29ybGQh"
}
```
