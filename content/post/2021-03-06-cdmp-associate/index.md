---
title: "CDMP Associate 認定を取得した話"
date: 2021-03-06T13:17:48+09:00
draft: false
summary: '日本語の情報が少ない気がするので備忘録としてメモを残すことにします。'
---

ついさきほど、DAMA CDMP Certification - Associate 認定を取得しました。

{{< tweet 1368043343477755906 >}}

日本語の情報が少ない気がするので備忘録として(2021/03/06 時点の)メモを残すことにします。


## CDMP とは何か？
データ管理を実践する国際的な非営利団体である[DAMA(Data Management Association)](https://www.dama.org/cpages/home) が提供する、データマネジメントのスキル、経験を証明する認定です。

[Certified Data Management Professionals (CDMP)](https://cdmp.info/about/)

下から順に、Associate, Practitioner, Master, Fellow という4つのレベルがあります。
このうち、下位の3つについては Data Management Fundamentals exam という共通テストの正答率に応じて認定が行われ、更にPractitioner, Master 認定を受けるには別途specialist examsと呼ばれる試験を2つ以上パスする必要があります。

今回はこの Data Management Fundamentals exam を受けて、Associateの認定を受けるまでの諸々を備忘録として残すことにします。


## Data Management Fundamentals exam とはどんな試験か？

[データマネジメント知識体系ガイド DMBoK2(Data Management Body Of Knowledge version 2)](https://technicspub.com/dmbok/) に基づき、その14のトピックについて理解度をテストされます。

* Data Management Process – 2%
* Big Data – 2%
* Data Architecture – 6%
* Document and Content Management – 6%
* Data Ethics – 2%
* Data Governance – 11%
* Data Integration and Interoperability – 6%
* Master and Reference Data Management – 10%
* Data Modelling and Design – 11%
* Data Quality – 11%
* Data Security – 6%
* Data Storage and Operations – 6%
* Data Warehousing and  Business Intelligence – 10%
* Metadata Management – 11%

5択問題が100問出題され、制限時間は110分(母国語が英語の場合は90分)です。
このうち、Associate 認定を受けるには 60%(60問)以上正答する必要があります。

試験は[CANVAS](https://www.instructure.com/)と呼ばれるe-learningサービスと、[Honorlock](https://honorlock.com/)というブラウザベースの試験監督サービスを組み合わせて実施されます。
PCにはWebカメラとマイクが必要で、外部モニタの使用は禁止されています。ブラウザは Google Chrome で、試験中は **Chrome のページ翻訳機能を利用することができます**。

また、試験には**紙書籍または電子書籍を1冊だけ持ち込むことが許可されています**。
電子書籍を持ち込む場合は、試験を受けるデバイスとは別のデバイス(タブレットやノートPC)で閲覧する必要があります。

本試験に申し込むと、何度でも受験可能な模擬試験(模擬問題200問中から毎回40問がランダム出題される)がついてきます。
模擬試験では設問に対する正答を見ることができるので、何を間違えたかの振り返りに便利です。

なお、試験費用はUSD $311です。

### Fellow 認定について
Fellowはこの共通テストの代わりに、`Globally recognised & respected thought leadership(世界的に認められ、尊敬される思想的リーダーシップ)` や `Significant contribution to Data Management profession(データマネジメントの専門家への多大な貢献)` および推薦が要件となっており、具体的なところはよくわかりません。

### 日本語版 DMBoK2について
紙媒体のみの販売で13200円、[Amazon.co.jp](https://www.amazon.co.jp/%E3%83%87%E3%83%BC%E3%82%BF%E3%83%9E%E3%83%8D%E3%82%B8%E3%83%A1%E3%83%B3%E3%83%88%E7%9F%A5%E8%AD%98%E4%BD%93%E7%B3%BB%E3%82%AC%E3%82%A4%E3%83%89-%E7%AC%AC%E4%BA%8C%E7%89%88-DAMA-International/dp/4296100491/ref=nav_signin?ie=UTF8&qid=1543639668&sr=8-6&keywords=DMBOK&)で買えます。電子版が欲しい・・

## 申し込み
[CDMP Exams](https://cdmp.info/exams/) から Data Management Fundamentals Exam の`ENROL IN EXAM` を選択し、`ENROLMENT INSTRUCTIONS` を押して、表示されたpdfファイルに記載された手順で手続きします。

1. CANVASにユーザ登録し、[https://cdmp.instructure.com/](https://cdmp.instructure.com/)にログインする
2. Coursesから`Data Management Fundamentals` を選択して、`ACCESS EXAM` を押す。
3. `Go to Payment Assignment` を押して、支払いと発行された `order number` を(e-learningの課題提出のような方法で)事務局へ提出します。

途中、`ACCESS EXAM` と `ACCESS EXAM ESL` を選ぶ箇所がありますが、母国語が英語でない方は`ESL(English as a Second Language)` を選ぶと、試験時間が20分伸びで110分になるので、こちらを選ぶのが良いと思います。

これで試験を受ける準備ができました。試験は24時間365日いつでも受けることができます。受験期限は特に決まっていないようです。

模擬試験は `Access practice exam here` から受けることができます。
本試験を受ける場合は、事前に[Honorlock Chrome拡張](https://static.honorlock.com/install/extension)をインストールしておく必要があります。


## 勉強法
[日本語版のDMBoK2](https://www.dama-japan.org/Introduction.html#DMBOK)を、別の資料にまとめ直す形で読み込みました。
出題率の高い `Master and Reference Data Management`, `Data Warehousing and  Business Intelligence`, `Metadata Management`, `Data Quality` の4つのトピックを重点的に読み込んで、その他の章については軽く眺める程度でした。トータル実質3週間くらい。

試験の前日に模擬試験を7,8回実施して、最終的な正答率は75%程度でした。問題こそ違うものの、本番の出題形式に近いので早い段階で何度か解いてみることをおすすめします。

### UdemyのCDMPコースについて
実は Udemyに [CDMP - Data Management Fundamentals Exam Questions on DMBOK2](https://www.udemy.com/course/cdmp-dmbok2/) というコースがありますが、実際に出題される問題や形式とは大きく異なるため、あまり参考にならないと考えておいたほうがよいです。私は一応購入しましたがほとんど使いませんでした。
こちらよりも、模擬試験を何度も解いたほうが良いです。


## 試験本番
試験開始前に、Webカメラの顔写真撮影と身分証明書の撮影があります。私は身分証としてパスポートを使用しました。
顔写真は背景になにか写っていると「なんか後ろに人がいるぞ」的なアラートが出るので、ノートPC持って部屋の壁まで移動して撮影しました。

その後、試験を受ける部屋を360度撮影します。ノートPC持ってその場でぐるっと一周しました。かなり適当に撮影しましたが特に何も指摘されませんでした。

ノートPC本体のカメラがUSBカメラの両方が接続されている場合、システムでカメラの切り替えができず、準備に手間取りました。
特に理由がなければ、USBカメラは使用せず、ノートPC単体で受験するのが無難です。

試験が始まると、Webカメラの映像とデスクトップ全体が試験監督と共有されます。
なにかトラブルがあれば、試験監督とはチャットでやりとりすることができます。

模擬試験と同様に、単一のページに100問全ての問題が表示され、画面をスクロールしながら進めます。残り時間は画面の一番上にしか表示されないので、毎回スクロールするのが面倒でした。

模擬試験と同じ問題は4,5問程度で、残りは初見でした。

試験問題は概ね DMBoK2 の掲載順に出題されるため、「いまはこのトピックについて問われているな」というのがある程度推測でき、回答の選択肢を絞りやすかったです。

書籍持ち込み可能な試験なので [日本語版のDMBoK2](https://www.dama-japan.org/Introduction.html#DMBOK)を紙媒体で持ち込みましたがほとんど使いませんでした。

試験が終わると、次の画面ですぐに得点が表示されます。模擬試験と異なり、問題と正否を確認することはできません。

### Chromeの翻訳機能について
ページ翻訳を利用するには注意が必要です。(私はこれで15分ほどロスしました)

試験中は右クリックが無効にされるため、アドレスバーの右に翻訳アイコンが表示されるよう、事前に以下を確認しておくことをおすすめします。
1. CANVASのユーザプロファイルページで、言語が`English(US)`になっていることを確認する
2. Chromeの設定で、`母国語以外のページで翻訳ツールを表示する` が有効になっていることを確認する
3. 模擬試験ページにアクセスし、アドレスバーの右に翻訳アイコンが表示されることを確認する

## 結果と認定の確認
認定は、CANVASの`Account` -> `My Badges` から確認できます。

私の場合は 78問正解だったので、Associate 認定 (正答率60%以上), Practitioner の要件の1つ(正答率70%)を満たしており、この2つが表示されていました。

認定バッジは [badgr](https://rr.badgr.com/my-badges) で確認できます。
試験を受けた時点でCANVASのdefaultに設定されたメールアドレスに対してバッジが発行されるため、badgrでも同様のメールアドレスを使用するか、アドレスの1つとして登録する必要があります。

{{< rawhtml >}}
<blockquote class="badgr-badge" style="font-family: Helvetica, Roboto, &quot;Segoe UI&quot;, Calibri, sans-serif;"><a href="https://api.badgr.io/public/assertions/ECQIOwCbQsixMYyRpNNZsw"><img width="120px" height="120px" src="https://api.badgr.io/public/assertions/ECQIOwCbQsixMYyRpNNZsw/image"></a><p class="badgr-badge-name" style="hyphens: auto; overflow-wrap: break-word; word-wrap: break-word;margin: 0; font-size: 16px; font-weight: 600; font-style: normal; font-stretch: normal; line-height: 1.25; letter-spacing: normal; text-align: left; color: #05012c;">DAMA CDMP Certification - Associate</p><p class="badgr-badge-date" style="margin: 0; font-size: 12px; font-style: normal; font-stretch: normal; line-height: 1.67; letter-spacing: normal; text-align: left; color: #555555;"><strong style="font-size: 12px; font-weight: bold; font-style: normal; font-stretch: normal; line-height: 1.67; letter-spacing: normal; text-align: left; color: #000;">Awarded:</strong>Mar 6, 2021</p><p style="margin: 16px 0; padding: 0;"><a class="badgr-badge-verify" target="_blank" href="https://badgecheck.io?url=https%3A%2F%2Fapi.badgr.io%2Fpublic%2Fassertions%2FECQIOwCbQsixMYyRpNNZsw" style="box-sizing: content-box; display: flex; align-items: center; justify-content: center; margin: 0; font-size:14px; font-weight: bold; width: 48px; height: 16px; border-radius: 4px; border: solid 1px black; text-decoration: none; padding: 6px 16px; margin: 16px 0; color: black;">VERIFY</a></p><script async="async" src="https://rr.badgr.com/assets/widgets.bundle.js"></script></blockquote>
{{< /rawhtml >}}
バッジはこんな感じで埋め込んだりできます。


## 雑感
* 受験前はかなり厳しい見立てをしていたが、思ったより良い成績で通せてよかった。
* もともとデータエンジニアとしてのバックグラウンドがあったので、データモデリングやビッグデータあたりは準備無しである程度得点できたが、データガバナンスが苦手で、模擬試験を通して勉強していった感じ。
* DMBoK2自体はかなり大きな組織で長期に渡る活動を想定してる雰囲気だが、データ品質の評価軸など、データを扱うシステムの要件設計などカジュアルに使えそうな部分もありそう。
