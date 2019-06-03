# Import product data into Elasticsearch

1. Download the latest 7.x version of logstash for your operating system from https://www.elastic.co/downloads/logstash. At the time of writing this book logstash-7.0.0 was the latest version.
2. Extract logstash on your system.
3. Copy the <b>files</b> directory in your logstash home folder. If logstash was installed at /usr/share/logstash, after copying the files, the structure of files should look like -

```shell
/usr/share/logstash/files/products.csv
/usr/share/logstash/files/logstash_products.conf
```

4. Update the logstash_products.conf file and ensure that it has the correct absolute path of products.csv file on your system.
5. Create the following index by executing the command in the your Kibana - Dev Tools.

```shell
PUT /amazon_products
{
  "settings": {
    "number_of_shards": 1,
    "number_of_replicas": 0,
    "analysis": {
      "analyzer": {}
    }
  },
  "mappings": {
    "products": {
      "properties": {
        "id": {
          "type": "keyword"
        },
        "title": {
          "type": "text"
        },
        "description": {
          "type": "text"
        },
        "manufacturer": {
          "type": "text",
          "fields": {
            "raw": {
              "type": "keyword"
            }
          }
        },
        "price": {
          "type": "scaled_float",
          "scaling_factor": 100
        }
      }
    }
  }
}
```

6. Run logstash from command line, using the following commands

```shell
cd /usr/share/logstash
bin/logstash -f files/logstash_products.conf
```

