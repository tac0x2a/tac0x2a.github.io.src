---
categories: ['make_online_judge', 'tech']
comments: true
date: '2016-03-22T19:43:37Z'
title: フレームワークを選ぶ(Javascript)
summary: 'Javascript で Web アプリを書くためのフレームワークを調べました。'
---

Javascript で Web アプリを書くためのフレームワークを調べました。

- [人気上昇中の JavaScript ライブラリを調べてみた【2016 年版】](http://www.buildinsider.net/web/popularjslib/2016)

## [AngularJS](https://angularjs.org/)

![AngularJS](http://staffblog.yumemi.jp/wp-content/uploads/2014/03/AngularJS-large.png)

- [AngularJS 入門](http://www.tohoho-web.com/ex/angularjs.html)

> これまでの Web サービスでは、サーバ側で画面(HTML/DOM)を生成していたのに対し、最近の Web サービスでは、サーバ側は DB 操作のみを処理し、クライアント－サーバ間を Ajax で JSON 交換し、画面(HTML/DOM)はクライアント側で生成する方式が増えてきました。AngularJS は、クライアント側 JavaScript のコントローラでデータモデルを管理し、画面(ビュー)とリアルタイムにデータを交換するのに適したフレームワークです。

なるほど、MVC の V に相当する部分を全部クライアントでやっちゃおうという感じですね。
PHP や JSP みたいに、html に埋め込んで記述するみたいです。

サーバ側では JSON をやりとりするバックエンドの実装が必要になります。

このバックエンドとして Rails(の特に ActiveRecord)が挙げられていましたが、
Node.js 上で動く[Express](http://expressjs.com/)というフレームワークと、MongoDB と組み合わせた、MEAN(MongoDB+Express+AngularJS+Node.js)という構成が有名みたいです。

MEAN を構築するには、Yeoman というワークフロー構築ツールを使うのが一般的みたいです。

- [あなたの Web 開発人生を変える Yeoman、Bower、Yo のインストールと使い方](http://www.atmarkit.co.jp/ait/articles/1407/02/news040.html)

Yoeman は Web フロントエンドでよくある構成を、Rails でいう scaffold のようにコマンドで生成するツールです。
Grunt(make 的なビルドツール), Bower(パッケージマネージャ), Yo(プロジェクトの雛形生成ツール)で構成されています。

- [Node.js の MVC フレームワーク「Express」の基礎知識とインストール](http://www.atmarkit.co.jp/ait/articles/1503/04/news047.html)

npm で `generator-angular-fullstack` を入れるだけで、Express やら Karma(実ブラウザで JavaScript コードを実行できる実行環境,テストランナー)やら Passport(node.js の認証ミドルウェア)が使えるようになるみたいです。

- [AngularJS で Web アプリケーションを作ろうと思った時に構成に悩んだら、generator-angular-fullstack からはじめるのが良いのでは](http://blog.mah-lab.com/2014/02/01/angular-fullstack/)

[Firebase](https://html5experts.jp/technohippy/18040/) という BaaS(Backend as a Service)もあるみたいです。

## [Angular2](https://angular.io)

![Angular2](http://blog.ninja-squad.com/assets/images/ng2-ebook/ng2-logo.png)

- [Angular2 は「使える」フレームワークか？](https://developers.eure.jp/tech/angular2_evaluation/)

AngularJS と比較して、劇的にスピードアップし、実装が Javascript から TypeScript ベースになったそうです。
今始めるならこちらかも。

- [[初心者向け] Angular2 からみる JS フレームワーク入門](http://rdlabo.jp/angular2-373.php)

## React

![React](http://res.cloudinary.com/hashnode/image/upload/v1455637506/static_imgs/mern/imgs/react.png)

- [5 分で理解する React.js](http://qiita.com/tomzoh/items/7fabe7cb57dd96425867)

AngularJS と比較されることの多いフレームワーク。こちらも MVC の V に相当する。違いとしては・・・

> React ではすべてを JS で書き切ることができるのに対して、Angular は HTML を拡張した独自の記法を使う必要があります。

というかんじらしい。

## まとめ

MEAN(MongoDB, Express, Angular2, Node.js)が良さそう。

今回はここまで。次回は別の言語のフレームワークを調べようかな。
