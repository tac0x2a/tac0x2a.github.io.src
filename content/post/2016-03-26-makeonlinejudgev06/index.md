---
categories: ['make_online_judge', 'tech']
comments: true
date: '2016-03-26T15:49:39Z'
title: Node.jsとExpress
summary: ' '
---

前回はフロントエンドとして Angular2 のチュートリアルを軽く触ってみました。
今回は Node.js + Express でバックエンドの環境を触ってみようと思います！

# Node.js

どちらもちょっと古め。Web アプリのフレームワークとして Express を紹介している。

- [基礎から学ぶ Node.js](http://gihyo.jp/dev/serial/01/nodejs/0001)
- [ビギナーのための Node.js プログラミング入門](http://libro.tuyano.com/index2?id=1115003)

# Express

- [express 実践入門](https://gist.github.com/mitsuruog/fc48397a8e80f051a145) - めちゃわかりやすい！

> express を理解する上での最小構成要素。
>
> - routing -
>   外部からの HTTP(S)リクエストに対して、内部のロジックをマッピングすること。

> - middleware -
>   routing の過程で何らかの処理を差し込む仕組み。
>   共通処理(認証、エラーハンドリング、リクエストデータの加工、etc)を本来のロジッ> クから分離して、コードベースを健全に保つ。

## Express のキーワード

- Jade - デファクトなテンプレートエンジン
- Mongoose - MongoDB な ORM
- Sequelize - PostgreSQL, MySQL, SQLite, MSSQL な ORM
- Passport - node.js の認証モジュールでデファクト

# まとめ

なんか作れそうな気がしてきた！
当面の方針として、Express で作ってみて、フロントエンドをリッチにしたくなってきたら Angular2 なり React なりで View を強化するようにしてみよう。
まずは、Node.js(Express)と Docker で

- ユーザ登録/認証
- 問題の登録
  - テストの登録
- 回答の登録
  - ユーザごとの回答の履歴
- 送信された回答とテストの実行

このあたりを作りたいと思います。
