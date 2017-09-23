{
  "query": {
    "match": {
      "transactionType.keyword": {
        "query": "Bank Initiated"
      }
    }
  }, "_source" : ["salePrice", "saleDate", "transactionType", "auctionSale"],
  "sort": [
    {
      "saleDate": {
        "order": "desc"
      }
    }
  ], 
 "size" : 20
}
