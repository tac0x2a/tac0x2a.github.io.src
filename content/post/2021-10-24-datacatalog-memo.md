---
title: "GCP Data Catalog のメモ"
date: 2021-10-24T11:32:27+09:00
draft: false
summary: 'Data Catalog をよく知らなかったのでメモ'
categories: ['bigquery', 'memo']
---

## 超雑感
+ BQのテーブルやカラム, GCSのファイルセット, Pub/Subトピックなどに型付きKey-Valueで値を設定できる
+ そのデータオーナは誰か、センシティブかなどを設定するのに使える
  + 従来ごちゃっと Description に書いてたものを、項目ごとに整理する感じかな
  + 一方でタグセットにうまく適合しない情報を書きたくなってくる気もする。データアセット(テーブル)ごとのdescriptionはあるけど、カラムごとになると、結局その他descriptionみたいなタグが欲しくなってきそう
+ 検索は Data Catalog のコンソール画面や API経由で、専用の検索構文で行える
+ 特定のタグセットが付与されたエントリを探したり、特定のタグの値を含むエントリを探せるみたい

## Data Catalog とは
これ。 https://cloud.google.com/data-catalog/

## Data Catalog が何を解決するか
https://cloud.google.com/data-catalog/docs/concepts/overview?hl=ja


## タグ と タグテンプレート
https://cloud.google.com/data-catalog/docs/tags-and-tag-templates?hl=ja

### タグ
> タグは「ビジネス メタデータ」と呼ばれることもあります。データアセットにタグを追加すると、アセットを使用する必要があるすべてのユーザーにわかりやすいコンテキストを提供できます。たとえば、タグは、特定のデータアセットの責任者、個人を特定できる情報（PII）が含まれているかどうか、アセットのデータ保持ポリシー、データ品質のスコアなどを示すことができます。

+ タグは型付きフィールドと値のペア
+ フィールドは後述のタグテンプレートで定義し、エントリ(テーブルとかカラムとか)に付与する時点で値を設定する

### タグテンプレート
> タグ テンプレートを使用すると、データアセットに関する共通のメタデータを 1 か所で作成して管理できます。タグはデータアセットに添付できるため、Data Catalog システムで検出できます。


+ タグを付与する場合は事前にタグセットを定義し、タグテンプレート単位で付与する
+ タグテンプレートは1つ以上のフィールドからなる
+ 特定のテンプレート使用している/使用していないエントリーを検索できる

テンプレート ギャラリーとして、いくつかタグセットが事前に用意されている。

### ポリシータグ
BQのテーブル内の列へのアクセス制御に使うタグ。コンソールでBGのテーブル表示したときに見えるあれ。


## エントリ と エントリグループ
https://cloud.google.com/data-catalog/docs/entries-and-entry-groups
![](https://cloud.google.com/data-catalog/images/dc-model.png)


### エントリ
エントリはタグを付与する対象っぽい。

+ BQ: データセットとテーブル が自動検出される
+ Pub/Sub: トピック が自動検出される
+ GCS ファイルセット(バケット/ファイルパターンにマッチするファイル群)の集合をエントリグループとして作成する必要がある
  タグはファイルセット単位で付与する

### エントリグループ

> エントリ グループを使用すると、Cloud Storage ファイルセットまたはカスタムデータ リソースタイプのエントリを作成および管理できます。ファイルセットとカスタム エントリはエントリ グループに配置する必要があります。ファイルセットを作成するには、エントリ グループを選択または作成し、そのエントリ グループ内にファイルセットを作成します。


+ 複数の GCS ファイルセットをまとめて1つのエントリとして扱う機能
+ 各ファイルセットはバケット名、ファイルパターン、スキーマで定義される
+ タグはファイルセットに対して付与するので、階層としてはBQのデータセットに近いかも
+ BQやPub/Subは エントリグループが自動的に作成されるっぽいので、(現時点では)実質ユーザがGCS用のエントリを作る機能っぽい


なお、GCP 外のデータソースに対するメタデータも管理できるらしい。テクニカルメタデータなのかな。

+ データソースを Data Catalog と統合する
  https://cloud.google.com/data-catalog/docs/integrate-data-sources

+ GoogleCloudPlatform/datacatalog-connectors-rdbms
  https://github.com/GoogleCloudPlatform/datacatalog-connectors-rdbms/tree/master/google-datacatalog-redshift-connector


### エントリの検索
Data Catalog の検索構文
https://cloud.google.com/data-catalog/docs/how-to/search-reference

