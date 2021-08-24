---
title: "yasuriコマンドでさくっとスクレイピング"
date: 2021-03-27T10:12:17+09:00
draft: false
summary: '以前リリースしたスクレイピングライブラリをちょっと改修してコマンドラインツールとして使えるようにしました'
categories: ['tech', 'dev']
---

## TL;DR

```sh
$ ruby -v
ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [x86_64-linux]

$ gem install yasuri

$ cat examples/sample.yml
# yasuri scrape "https://www.tac42.net/" -f sample.yml
links_each:
  path: //*[@id="posts"]/article/header/h1/a
  text_title: //*[@id="content"]/article/header/h1
  text_description: /html/head/meta[12]/@content
  text_date:
    path: //*[@id="content"]/article/header/div/span
    proc: :strip
  text_length:
    path: //*[@id="content"]
    proc: :size

$ yasuri scrape "https://www.tac42.net/" -f examples/sample.yml | jq
[
  {
    "title": "CDMP Associate 認定を取得した話",
    "description": "日本語の情報が少ない気がするので備忘録としてメモを残すことにします。",
    "date": "2021-03-06",
    "length": 5349
  },
  {
    "title": "2020年のまとめ",
    "description": "今年も一年を振り返っていきたいと思います。",
    "date": "2020-12-31",
    "length": 3177
  },
  {
    "title": "小さなデータ基盤 Nayco をリリースしました",
    "description": "オンプレでも頑張って動く小さなデータ基盤 Nayco を作りました",
    "date": "2020-08-17",
    "length": 4874
  },
  {
    "title": "docker stackでk8sを使ってみるメモ",
    "description": "既存の docker-compose.yml で k8sにデプロイできると聞いて調べてみたメモ。",
    "date": "2020-06-08",
    "length": 2851
  },
  {
    "title": "Vue.js に関するメモ",
    "description": "Vue.js について少し勉強したので、思い出したいところだけメモ",
    "date": "2020-05-10",
    "length": 28250
  }
]
```

## どんなことができるの？
+ ページ内の複数のテキストをスクレイピングし、名前をつけてHashにする
+ ページ内の複数のリンクを開いて、各ページをスクレイピングした結果をHashで取得する
+ ページ内に繰り返し出現するテーブルをそれぞれスクレイピングして、配列として取得する
+ ページネーションで提供される各ページのうち、最初の3ページだけをスクレイピングする

みたいな、よくある処理を簡単なyamlまたはjsonで書くだけで、よしなにスクレイピングしてくれます。


## `yasuri` コマンド
スクレイピングを宣言的な書式で行うコマンドです。書式をファイルまたはコマンドで与えて実行します。

```sh
# ファイル指定して実行
$ yasuri scrape "https://www.tac42.net/" -f examples/sample.yml

# 直接指定して実行
$ yasuri scrape "https://www.ruby-lang.org/en/" -j '
{
  "text_title": "/html/head/title",
  "text_desc": "//*[@id=\"intro\"]/p"
}'
```

詳しい書式は [YasuriのUsage](https://github.com/tac0x2a/yasuri/blob/master/USAGE.ja.md#%E3%83%91%E3%83%BC%E3%82%B9%E3%83%84%E3%83%AA%E3%83%BC)を参照。


## どういう仕組で動いているの？

Rubyのスクレイピングライブラリ Yasuri を使っています。

[tac0x2a/yasuri](https://github.com/tac0x2a/yasuri)

