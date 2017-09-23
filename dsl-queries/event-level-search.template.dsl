DELETE _search/template/event-level-search

POST _scripts/event-level-search
{
  "script": {
    "lang": "mustache",
    "source": {
      "query": {
        "query_string": {
          "query": "{{query_string}}"
        }
      }
    }
  }
}

GET _scripts/event-level-search

GET /_render/template
{
    "id": "event-level-search", 
    "params": {
        "query_string": "bank"
    }
}

GET real-estate-sales/_search/template
{
    "id": "event-level-search", 
    "params": {
        "query_string": "bank"
    }
}
