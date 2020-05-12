---
categories: ['make_online_judge', 'tech']
comments: true
date: '2016-03-27T23:23:06Z'
title: Dockerによる環境構築
summary: ' '
---

# 開発/実行環境を作る

とりあえず、Node.js, Express, MongoDB が動作する環境を作る。
他環境へ持って行ったり、どこかで自動テストできるように、
以下を参考にしながら開発/実行環境を Docker で作る。

- [docker-compose を使って最高の開発環境を手に入れた](http://blog.muuny-blue.info/7d128c1d4a33165a8676d1650d8ff828.html)

上記を参考に作ったらこんなかんじになった。

- [tac0x2a/judgesv_devenv](https://github.com/tac0x2a/judgesv_devenv)

# ところが・・・

MongoDB の Volume マウントでハマった。

```
2016-03-27T16:58:37.013+0000 I CONTROL  [initandlisten] options: {}
2016-03-27T16:58:37.069+0000 I STORAGE  [initandlisten] exception in initAndListen: 98 Unable to create/open lock file: /data/db/mongod.lock errno:13 Permission denied Is a mongod instance already running?, terminating
2016-03-27T16:58:37.069+0000 I CONTROL  [initandlisten] dbexit:  rc: 100
```

- [Mac の Docker 上で動く MongoDB のデータを永続化するの大変そう](http://qiita.com/ota42y/items/af90ada86fd671dc5122)

> MongoDB は VirtualBox の共有フォルダはサポートしていないようです。

どうしよ。。。

# 2016/03/28 追記

mongo のイメージはそれほど頻繁に更新されんだろうと踏んで、とりあえず MongoDB は DataVolume を諦めることに。

次回からいよいよアプリを作りますよー
