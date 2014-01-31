# ElasticSearchの簡易調査

## ElasticSearchのインストール(OSX)

DL: http://www.elasticsearch.org/downloads/1-0-0-rc1/
適当なディレクトリに解凍。

日本語対応`Analyzer`をインストール

```
% ES_PATH/bin/plugin -i elasticsearch/elasticsearch-analysis-kuromoji/2.0.0.RC1
```

