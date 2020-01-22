## Currencies update

##### To update currencies rates run rake task

  `rake currency:update`

## Endpoints

##### To get all currencies on selected page:

  `GET /currencies?page=[page_number]`

##### To get selected currency by id:

  `GET /currencies/[currency_id]`

  Both requests require authentication token in request headers as `Authorization: token`
  
##### Valid token is:

  `eyJhbGciOiJIUzI1NiJ9.InNlY3VyZSBzdHJpbmci._EZH5dX9UCDY_L1NbOv4-wpyPrUly-XMfWNLqn2fDjk`
## Requests examples for localhost
  `curl -X GET -H 'Authorization: eyJhbGciOiJIUzI1NiJ9.InNlY3VyZSBzdHJpbmci._EZH5dX9UCDY_L1NbOv4-wpyPrUly-XMfWNLqn2fDjk' -d "page=1" localhost:3000/currencies`

------------


  `curl -X GET -H 'Authorization: eyJhbGciOiJIUzI1NiJ9.InNlY3VyZSBzdHJpbmci._EZH5dX9UCDY_L1NbOv4-wpyPrUly-XMfWNLqn2fDjk' localhost:3000/currencies/1`