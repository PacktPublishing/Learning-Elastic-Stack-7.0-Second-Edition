# Import network traffic data to learn Analytics capabilities of Elasticsearch

Steps 1 and 2 are required only if logstash is not previously installed on your system. 

1. Download the latest 7.x version of logstash for your operating system from https://www.elastic.co/downloads/logstash. At the time of writing this book logstash-7.0.0 was the latest version.
2. Extract logstash on your system.
3. Copy the <b>files</b> directory in your logstash home folder. If logstash was installed at /usr/share/logstash, after copying the files, the structure of files should look like -

```shell
/usr/share/logstash/files/network_traffic_data.zip
/usr/share/logstash/files/logstash_network_traffic_data.conf
```

4. Unzip network_traffic_data.zip that should create a file network_traffic_data.json in the same directory.

```shell
/usr/share/logstash/files/network_traffic_data.json
```

5. Update the logstash_network_traffic_data.conf file and ensure that it has the correct absolute path of network_traffic_data.json file on your system.
6. Create the following index by executing the command in the your Kibana - Dev Tools.

```shell
PUT /bigginsight
{
  "settings": {
    "index": {
      "number_of_replicas": "1",
      "number_of_shards": "5"
    }
  },
  "mappings": {
    "properties": {
      "accessPointId": {
        "type": "keyword",
        "fields": {
          "analyzed": {
            "type": "text"
          }
        }
      },
      "application": {
        "type": "keyword",
        "fields": {
          "analyzed": {
            "type": "text"
          }
        }
      },
      "band": {
        "type": "keyword",
        "fields": {
          "analyzed": {
            "type": "text"
          }
        }
      },
      "bandwidth": {
        "type": "double"
      },
      "category": {
        "type": "keyword",
        "fields": {
          "analyzed": {
            "type": "text"
          }
        }
      },
      "customer": {
        "type": "keyword",
        "fields": {
          "analyzed": {
            "type": "text"
          }
        }
      },
      "department": {
        "type": "keyword",
        "fields": {
          "analyzed": {
            "type": "text"
          }
        }
      },
      "downloadCurrent": {
        "type": "double"
      },
      "downloadTotal": {
        "type": "integer"
      },
      "inactiveMs": {
        "type": "integer"
      },
      "location": {
        "type": "geo_point"
      },
      "mac": {
        "type": "keyword",
        "fields": {
          "analyzed": {
            "type": "text"
          }
        }
      },
      "networkId": {
        "type": "keyword",
        "fields": {
          "analyzed": {
            "type": "text"
          }
        }
      },
      "signalStrength": {
        "type": "integer"
      },
      "time": {
        "type": "date",
        "format": "strict_date_optional_time||epoch_millis"
      },
      "uploadCurrent": {
        "type": "double"
      },
      "uploadTotal": {
        "type": "integer"
      },
      "usage": {
        "type": "double"
      },
      "username": {
        "type": "keyword",
        "fields": {
          "analyzed": {
            "type": "text"
          }
        }
      }
    }
  }
}
```


7. Run logstash from command line, using the following commands

```shell
cd /usr/share/logstash
bin/logstash -f files/logstash_network_traffic_data.conf
```

