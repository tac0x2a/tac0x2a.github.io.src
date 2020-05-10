---
categories: ['make_online_judge', 'tech']
comments: true
date: '2016-04-24T14:30:27Z'
title: AngularJS導入
---

随分間が空きましたがこつこつ進めてますよ！

npm で AngularJS 入れると node_modules の下に入ってしまい面倒なので Bower を使ってみることに。

- [ここ数年前から 2015/5 までのモダンフロントエンドを総まとめしてみた](http://qiita.com/okmttdhr/items/1caff5a36c8468779a64)

> Angular.js 2.0 や React.js など、ES6 の流れをくんでいるスクリプトは、Node.js の世界で完結させることができるので、今後 Bower は使いドコロが減ってゆきそうです。

ぐぬぬ。初心者なのでちょっと枯れてるくらいが丁度いいんですよ！

## Bower 入れる

![Bower](http://bower.io/img/bower-logo.svg)

アイコンかわいい！

Bower はフロントエンドで使われるパッケージマネージャ。npm はバックエンド(Node.js)用と考えておけば OK っぽい。

- [Bower - A package manager for the web](http://bower.io/)
- [npm とか bower とか一体何なんだよ！Javascript 界隈の文脈を理解しよう](http://qiita.com/megane42/items/2ab6ffd866c3f2fda066)

```sh
$ npm install -g bower
```

以下の内容で`.bowerrc`を作る。

```json
{
  "directory": "public/components",
  "json": "bower.json"
}
```

```sh
$ bower init
```

## 余計な静的ファイルを見えないようにする

bower のパッケージを public の下にしたので、`app.js`の静的ファイルのルーティングを修正して、余計なファイル(Bowerde 入れたパッケージの README.md とか)を見えないように、必要な物だけ見せるように設定する。

```diff
-app.use(express.static(path.join(__dirname, 'public')));
+app.use('/images', express.static(path.join(__dirname, 'public','images')));
+app.use('/javascripts',express.static(path.join(__dirname, 'public','javascripts')));
+app.use('/stylesheets',express.static(path.join(__dirname, 'public','stylesheets')));
+app.use('/semantic',express.static(path.join(__dirname, 'public','semantic')));
+app.use('/angular',express.static(path.join(__dirname, 'public','components','angular')));
```

## AngularJS を入れる

```sh
$ bower install --save angular
```

あとは以下を参考に。

- [MongoDB+Express+AngularJS+Node.js でシンプルな CRUD アプリ作成](http://qiita.com/naga3/items/e63144e17cb1ab9e03e9)

# 小ネタ

## ファイル変更で自動サーバ再起動

```
$ npm install -g nodemon
```

以下のコマンドで起動する。

```
$ nodemon ./bin/www
```
