---
categories: ['make_online_judge', 'tech']
comments: true
date: '2016-04-13T08:04:24Z'
title: テストフレームワークを導入する(mocha)
summary: ' '
---

ユーザのサインアップ、ログイン・ログアウトを実装できたので
いよいよ本格的に機能を作りこんでいきたいのですが、
やはりテストが無いと不安です。

# Mocha

比較的シンプルそうなテストフレームワーク [mocah](http://mochajs.org/) を導入します。

- [Mocha](http://mochajs.org/)

```
$ npm install -g mocha --save-dev
```

さっそく動かしてみる.

```
$ mkdir test
$ touch test/test.js
```

```js
var assert = require('chai').assert;
describe('Array', function () {
  describe('#indexOf()', function () {
    it('should return -1 when the value is not present', function () {
      assert.equal(-1, [1, 2, 3].indexOf(5));
      assert.equal(-1, [1, 2, 3].indexOf(0));
    });
  });
});
```

```
$ mocha
```

```
Array
  #indexOf()
    1) should return -1 when the value is not present

0 passing (14ms)
1 failing

1) Array #indexOf() should return -1 when the value is not present:
   ReferenceError: assert is not defined
    at Context.<anonymous> (test/test.js:4:7)
```

お、動いてるっぽい。
ちなみにアサーションには Chai を使っています。

- [Chai](http://chaijs.com/)

```js
var assert = require('chai').assert;
```

Chai は他にも `expect` や `should` を使った書き方もサポートしています。
`should` や `expect` は Rspec で使っていましたが冗長になりがちだったので、今回は assert を使ってみようと思います。

# CI に乗せる

いつもの Travis-CI で。

- [Travis CI](https://travis-ci.org/)
- [Building a Node.js project](https://docs.travis-ci.com/user/languages/javascript-with-nodejs)

以下の内容で `.travis.yml` をリポジトリのルートに作る。

```yml
language: node_js
node_js:
  - '5.9.0'
```

TravisCI は `npm test` を叩いてテストするので、`package.js` に以下を加える。

```js
{
...
  "scripts": {
    "test": "mocha"
  },
...
}
```

TravisCI でリポジトリを有効にしてビルド。`README.md`にバッジを追記する。

```
......
$ npm test
> WitchCoder@0.0.0 test /home/travis/build/tac0x2a/WitchCoder
> mocha
  login
    /return
  ✓ should be return error when email is empty
  ✓ should be return error when name is empty
  ✓ login failed if user not found
  ✓ login failed if password is not matched
  4 passing (14ms)
The command "npm test" exited with 0.
Done. Your build exited with 0.
```

動いてる！いい感じ〜
