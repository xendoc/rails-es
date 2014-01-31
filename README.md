# ElasticSearchの簡易調査

## ElasticSearchのインストール(OSX)

DL: http://www.elasticsearch.org/downloads/1-0-0-rc1/
適当なディレクトリに解凍。

日本語対応`Analyzer`をインストール

```
% ES_PATH/bin/plugin -i elasticsearch/elasticsearch-analysis-kuromoji/2.0.0.RC1
```


## Venueデータを登録

mysqlのダンプデータを入れてください。


## ElasticSearchのインデックスを作成

```
> Venue.import
```


## 検索

コンソールから

```
> Venue.search({query: 'xxxxx', lat: 35.663281, lng: 139.7024063})
```