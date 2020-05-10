---
categories: ['make_online_judge', 'tech']
comments: true
date: '2016-03-23T23:57:43Z'
title: Angular2入門
---

とりあえず Angular2 を触ってみよう。合わなければやめる方向で。

[TUTORIAL: TOUR OF HEROES](https://angular.io/docs/ts/latest/tutorial/)

## 環境構築

そもそも node と npm が入ってないので入れる。
nvm(NodeVersionManager)

```
% brew install nvm
```

```
Add NVM's working directory to your $HOME path (if it doesn't exist):

  mkdir ~/.nvm

Copy nvm-exec to NVM's working directory

  cp $(brew --prefix nvm)/nvm-exec ~/.nvm/

Add the following to $HOME/.bashrc, $HOME/.zshrc, or your shell's
equivalent configuration file:

  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh

Type `nvm help` for further information.
```

と言われたので、

```
% mkdir ~/.nvm
% cp $(brew --prefix nvm)/nvm-exec ~/.nvm/
% echo 'export NVM_DIR=~/.nvm' >> .zshrc.mine
% echo 'source $(brew --prefix nvm)/nvm.sh'  >> .zshrc.mine
% soruce ~/.zshrc
```

これで nvm が使えるようになった。node をインストールする。

```
% nvm --version
% nvm ls-remote #利用可能なnodeのバージョン
% nvm install v5.9.0  #一番新しそうなver
```

```
% node -v
v5.9.0

% npm -v
3.7.3
```

## いよいよチュートリアル

[5 MIN QUICKSTART](https://angular.io/docs/ts/latest/quickstart.html)
全然 5 分ぢゃない・・・

まずは環境構築。`tsconfig.json`, `typings.json`, `package.json` を用意して・・・

```
% npm install
```

`app/app.component.ts`, `app/main.ts`, `index.html`, `style.css`, を追加して

```
% npm start
```

上記で、"My First Angular 2 App" が表示されることを確認。動いてるっぽい。

今回はとりあえずここまで。
