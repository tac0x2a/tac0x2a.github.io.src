---
comments: true
date: '2016-01-02T02:27:30Z'
title: Octopressで記事を書くには
summary: '備忘録です．Octopress に乗り換えたものの，環境構築忘れるとあれなので．'
---

![](https://cdn.tutsplus.com/webdesign/authors/ian-yates/octopress-header.png)

備忘録です．Octopress に乗り換えたものの，環境構築忘れるとあれなので．

https://tac0x2a.github.io/

## セットアップ

```
$ git clone git@github.com:tac0x2a/tac0x2a.github.io.git
$ cd tac0x2a.github.io
$ git checkout source
$ rbenv exec bundle install
$ git clone git@github.com:tac0x2a/tac0x2a.github.io.git _deploy
```

## 記事を書く

```
$ rbenv exec bundle exec rake new_post\['Entry Title'\] # source/_posts 以下にファイルが出来る
$ emacs source/_posts/<yyyy-mm-dd->'EntryTitle'.markdown
```

## 記事を確認する

```
$ rbenv exec bundle exec rake preview
$ open http://localhost:4000
```

## Source にコミット

```
$ git add source/_posts/<yyyy-mm-dd->'EntryTitle'.markdown
$ git commit -m "Add new post."
$ git push origin source:source
```

## 記事を公開する

```
$ rbenv exec bundle exec rake gen_deploy #masterブランチに_deploy以下がpushされる
```

たぶんあってる．
