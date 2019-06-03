# Import product data into Elasticsearch

1. Download the latest 7.x version of logstash for your operating system from https://www.elastic.co/downloads/logstash. At the time of writing this book logstash-7.0.0 was the latest version.
2. Extract logstash on your system.
3. Copy the <b>files</b> directory in your logstash home folder. If logstash was installed at /usr/share/logstash, after copying the files, the structure of files should look like -

```shell
/usr/share/logstash/files/products_with_features_products.csv
/usr/share/logstash/files/logstash_products_with_features_products.conf
/usr/share/logstash/files/products_with_features_features.csv
/usr/share/logstash/files/logstash_products_with_features_features.conf
```

The first two files are the files containing products data and logstash configuration file for loading products data respectively.
The third and fourth files are the files containing data for features of the products and logstash configuration file for loading features data respectively.

4. Update the logstash_products_with_features_products.conf file and ensure that it has the correct absolute path of products_with_features_products.csv file on your system. Similarly, update the logstash_products_with_features_features.conf file and ensure that it has the correct absolute path of products_with_features_features.csv file on your system
5. Create the following index by executing the command in the your Kibana - Dev Tools.

```shell
PUT /amazon_products_with_features
{
  "settings": {
    "number_of_shards": 1,
    "number_of_replicas": 0,
    "analysis": {
      "analyzer": {}
    }
  },
  "mappings": {
    "doc": {
      "properties": {
        "id": {
          "type": "keyword"
        },
        "product_or_feature": {
          "type": "join",
          "relations": {
            "product": "feature"
          }
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
        },
        "feature_key": {
          "type": "keyword"
        },
        "feature": {
          "type": "keyword"
        },
        "feature_value": {
          "type": "keyword"
        }
      }
    }
  }
}
```

6. Run the following commands from command line

```shell
cd /usr/share/logstash
bin/logstash -f files/logstash_products_with_features_products.conf
```

After running the second command press CTRL + C to terminate logstash. These commands would have loaded the products data into the Elasticsearch index. Next, let's load the features using the following command.

```shell
bin/logstash -f files/logstash_products_with_features_features.conf
```
