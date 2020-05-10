---
categories: ['tech']
title: 作ったものとか
---


作ったものとか．

---
## [Yasuri](https://github.com/tac0x2a/yasuri)
Webスクレイピング処理を宣言的に記述するためのRubyライブラリです．

```ruby
require 'yasuri'
require 'machinize'

# Node tree constructing by DSL
root = Yasuri.links_root '//*[@id="menu"]/ul/li/a' do
         text_title '//*[@id="contents"]/h2'
         text_content '//*[@id="contents"]/p[1]'
       end

agent = Mechanize.new
root_page = agent.get("http://some.scraping.page.net/")

result = root.inject(agent, root_page)
# => [ {"title" => "PageTitle1", "content" => "Page Contents1" },
#      {"title" => "PageTitle2", "content" => "Page Contents2" }, ...  ]

```


よくある以下のような処理を、宣言的に、簡単に記述することができます．

+ ページ内の複数のリンクを開いて、各ページをスクレイピングした結果をHashで取得する
+ ページ内の複数のテキストをスクレイピングし、名前をつけてHashにする
+ ページ内に繰り返し出現するテーブルをそれぞれスクレイピングして、配列として取得する
+ ページネーションで提供される各ページのうち、上位3つだけを順にスクレイピングする

[github.com/tac0x2a/yasuri](https://github.com/tac0x2a/yasuri)

---
## [AutoSettings](https://play.google.com/store/apps/details?id=net.tac42.auto_settings)
起動しているアプリやシステムの状態に応じて設定を自動で切り替えるAndroidアプリです．

![](./autosettings_01.png)
![](./autosettings_02.png)

---
## [Droid Jammer](https://play.google.com/store/apps/details?id=jp.dip.wt.lmm)
顔認識ライブラリを利用して，画像中の顔を隠すAndroidアプリです．
![](./droidjammer_01.png)

---
## [932mania](https://932mania.tac42.net)
![932mania](932mania.png)

[932mania](https://932mania.tac42.net)

[github.com/tac0x2a/932mania](https://github.com/tac0x2a/932_mania)


Vue.js + Firebase で作ったお試しアプリ。Wikipediaをスクレイピングして、「草津」から始まる記事を表示します。


