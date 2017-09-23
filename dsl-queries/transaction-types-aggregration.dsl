########
## Count of Sales Per Transaction Type 
########
POST /real-estate-sales/_search
{
  "aggs": {
    "4": {
      "terms": {
        "field": "transactionType.keyword"
      }
    }
  },
  "size": 0
}
