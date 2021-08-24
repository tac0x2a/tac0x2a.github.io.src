---
title: 'Shell Script のメモ'
date: 2021-08-08T09:15:40+09:00
draft: false
summary: 'Shell Script のメモ'
categories: ['tech', 'lang', 'memo']
---

## はじめに

```sh
#!/bin/bash
```

shebang には bash を明記する。
`/bin/sh` は Bourne Shell への simlink になっていて、bash じゃないこともあるので。

## 変数とか

```sh
hoge='hello,world shell'
echo $hoge         # hello,world shell
echo ${hoge}script # hello,world shellscript

declare -ri v=42 # 整数型(i)のread-only(r)変数

# 配列
declare -a arr=(alice bob charlie [4]=eve)
echo ${arr[0]} #=> alice
echo ${arr[3]} #=> 空文字列
echo ${arr[4]} #=> eve
echo ${!arr[@]} # 0 1 2 4 # 値の存在するインデックス
arr[3]=dave # 値をセット
echo ${#arr[@]} #=> 5 # 要素の数
echo ${arr[@]} #=> alice bob charlie dave eve #

declare -a arr2=(zero "${arr[@]}" frank) # 配列のコピー&要素の追加。
                                         # [@]は "$arr[0]" "$arr[1]" ... として展開される。
echo ${arr2[@]} #=> zero alice bob charlie dave eve frank

arr+=(frank george) # 末尾ならこういう追加もできる
echo ${arr[@]} #=> alice bob charlie dave eve frank george


# 連想配列
declare -A map=([a]=alice [b]=bob [c]=charlie)
echo ${map[b]} #=> bob
map[e]=eve
unset map[b] # 値の削除
echo ${#map[@]} #=> 3 # 要素の数
echo ${map[@]} #=> eve charlie alice # 値一覧
echo ${!map[@]} #=> e a c # キー一覧
```

### 環境変数

シェルからコマンド実行すると別のプロセスとして実行されるが、この別プロセスへ引き継がれる変数を環境変数という。

```sh
TARGET=/home/tac        # これはただたの変数で、子プロセスには引き継がれない
export TARGET=/home/tac # exportすると環境変数になる
TARGET=/home/tac ls     # この子プロセス実行時だけ引き渡すこともできる

# 事前定義済み環境変数の場合はあらためてexportする必要はない
LANG=ja_JP.UTF-8
```

特殊なシェル変数

- `HOME`: ホームディレクトリ
- `PWD`: カレントディレクトリ
- `SHELL`: ログインシェルのフルパス
- `BASH`: 実行中の bash のフルパス
- `BASH_VERSION`: 実行中の bash のバージョン
- `LINELO`: シェルスクリプトの行番号。デバッグとかに使える
- `LANG`: ロケール。関連する変数がいくつかあり、`locale` コマンドで値を確認できる
- `PATH`: ぱす
- `IFS`: Internal Field Separator、シェルの区切り文字。IFS を別の値にして、スペースの入った文字列のリストを処理したりできる。

### 位置パラメータ

```sh
#!/bin/bash

# ./tmp.sh aaa bbb ccc

echo $0    # ./tmp.sh # 実行したスクリプトへのパス
echo $1    # aaa # 第1引数
echo $3    # ccc # 第3引数
echo $38   # ccc8 # $9以上は中括弧で囲って参照する必要がある
echo ${38} #  # 与えられてない引数は空文字列扱い
echo $@    # aaa bbb ccc # 引数を展開
echo $*    # aaa bbb ccc # 引数を展開。あんまり使わない
echo "$@"  # aaa bbb ccc # "$1" "$2" "$3" それぞれ別の文字列として展開。ループとかできる
echo "$*"  # aaa bbb ccc # "$1 $2 $3"  スペース区切りの1つの文字列として扱われる。あんまり使わない

echo $# # 3 個数
echo $? # 0 直前に実行したコマンドの終了ステータス。0なら成功、それ以外なら失敗になっていることが多い
echo $$ # 6467 # 現在のPID
echo $! # 6464 最後に実行したバックグラウンドプロセスのPID。なければ空文字列。
        # バックグラウンド実行して監視したり、あとから殺すために変数に入れておいたりする。
```

## パターン

- `?`: 任意の 1 文字
- `*`: 任意の文字列
- `[abc]`: a,b,または c のいずれか 1 文字。正規表現っぽい。`[a-c]` という書き方もできる。
- `[^abc]` または `[!abc]`: a,b,c 以外の任意の 1 文字。正規表現っぽいあれ。
- `{alpha,beta}`: alpha または beta
- `{8..11}`: 8,9,10,11 のいずれか。連番のファイルを対象にするとき便利そう
- `{c..f}`: c,d,e,f のいずれか。
- `~`: ホームディレクトリ

## パラメータ展開

変数の前に`$`をつけると、変数の値が展開される。

### 変数定義有無による展開ルール

```sh
echo ${name:-piyo} # piyo # 値が空文字ならpiyo
hoge=fuga
echo ${name:-piyo} # fuga # 値があればそれを使う
echo target dir is ${1:-.} # 引数($1など)のデフォルト値を設定するのによく使う

echo ${target:?Target dir is required.} # bash: target: Target dir is required.
                                        # 値が設定されてないときにエラーメッセージ表示する
echo $? # 1 # エラーなので

# ${var:+value} は 値が設定されているときはvalueを返す
```

### 文字列をごにょごにょする

```sh
file=/home/tac/hello-world.sh
echo ${file:8} # c/hello-world.sh # 8文字目から表示
echo ${file: -2} # sh # 後ろから2文字だけ表示。
                 # :と-の間にスペース開けないと未定義時のデフォルト値としてパースされちゃうので注意。

echo ${file:8:3} # c/h # 8文字目から3文字だけ表示
echo ${file:8:-3} # c/hello-world # 8文字目から末尾3文字削ったところまで表示
echo ${file:8:65535} # c/hello-world.sh

echo ${#file} # 24 # 文字数


# パターンに一致するところを取り除く

# 前方一致(文字列の先頭から探す)
echo ${file#*o} # me/tac/hello-world.sh # 最短一致
echo ${file##*o} # rld.sh               # 最長一致

# 後方一致(文字列の末尾から探す)
echo ${file%o*} # /home/tac/hello-w # 最短一致
echo ${file%%0*} # /h               # 最長一致

echo ${file##*/}  # hello-world.sh       # ファイル名だけ取得したり
echo ${file%/.sh} # home/tac/hello-world # 拡張子取り除いたりできる



# 置換
echo ${file/o/o~} # /ho~me/tac/hello-world.sh    # 最初に見つかったところだけ置換
echo ${file//o/o~} # /ho~me/tac/hello~-wo~rld.sh # 全部置換

echo ${file/#*\//any-dir/} # any-dir/hello-world.sh # 先頭から一致したところを置換、エスケープは\/
echo ${file/%sh/shell} # /home/tac/hello-world.shell # 末尾から一致したところを置換
```

### 配列/連想配列の展開, 操作

インデックスの指定は文字列と同じっぽい。

```sh
arr=(aaa.txt bbb.tgz ccc.tgz ddd.7z)
echo ${arr[@]:1}   # bbb.tgz ccc.tgz ddd.7z
echo ${arr[@]:1:2} # bbb.tgz ccc.tgz

echo ${arr[@]/tgz/tar.gz} # aaa.txt bbb.tar.gz ccc.tar.gz ddd.7z # 各要素に対して置換できる
```

### コマンド展開

`` `コマンド` `` 記法より `$(command)` の方が可読性が高く良いらしい。

```sh
echo $(date +%Y-%m-%d).txt # 2021-08-08.txt
```

### 算術式評価

```sh
((seconds = 3600 * 24 *365)) # 算術式を評価する
echo $seconds # 31536000

echo $((2**16)) # 65536 # 展開もできる

# 0(偽)なら1、それ以外は0
((2**16)); echo $? # 0
((1 - 1)); echo $? # 1
((5 > 3)); echo $? # 0
((5 < 3)); echo $? # 1
```

### プロセス置換

`<(コマンド)` と書くと、コマンドの実行結果をファイルストリームっぽく扱えて、別のコマンドの引数として書くことができる。
内部コマンドの標準出力が、別のコマンドのファイル入力として扱われる。

実際は `echo diff /dev/fd/63 /dev/fd/62` みたいに、一時的なファイルディスクリプタが作られてて、そこから読み込んでいる。

```sh
ls a b
# a:
# fuga.txt  hoge.txt  piyo.txt
# b:
# fuga.txt  hoge.txt

diff <(ls ./a) <(ls ./b) # <(コマンド)
# 3d2
# < piyo.txt
```

### 履歴展開

```sh
!!      # 直前のコマンドを参照
!n      # n個前のコマンドを参照
!hoge   # 最後に実行したhogeから始まるコマンド
!?hoge? # 最後に実行したhogeを含むコマンド
```




## testコマンド
`[ ]` または `[[ ]]`コマンドは、真なら 0, 偽なら 1 を終了ステータスとして返すコマンド。

`[[ ]]` は、コマンド中で `&&` や `||` が使える。

```sh
[ $(($1 % 3)) -eq 0 ] && [ $(($1 %  5)) -eq 0 ]
[[ $(($1 % 3)) -eq 0  && $(($1 %  5)) -eq 0 ]] # [[ ]] なら、中で && が使える

[ $str1 '>' $str2 ]
[[ $str1 > $str2 ]] # [[ ]] なら、クオートが不要
```


| 演算子               | 覚え方 | 意味 |
| -------------------- | ------ | ---- |
| `[ cond1 -a cond2 ]` | `a`nd  | AND  |
| `[ cond1 -o cond2 ]` | `o`r   | OR   |
| `[ ! cond ]`         | not    | NOT  |

`[` はコマンドなので、前後にはスペースが必要！注意して！

### 文字列

| 演算子                                   | 覚え方        | 真になる条件           |
| ---------------------------------------- | ------------- | ---------------------- |
| `[ str1 = str2 ]` or `[ str1 == str2 ]`  | -             | 一致する               |
| `[ str1 != str2 ]`                       | -             | 不一致                 |
| `[ -n str ]`                             | `n`ot empty   | 空文字じゃない         |
| `[ -z str ]`                             | `z`ero length | 空文字である           |
| `[ str1 '<' str2 ]`, `[ str1 '>' str2 ]` | -             | 辞書順で比較して真なら |

### 整数

| 演算子              | 覚え方                    | 真になる条件     |
| ------------------- | ------------------------- | ---------------- |
| `[ int1 -eq int2 ]` | `eq`ual                   | 等しい           |
| `[ int1 -ne int2 ]` | `n`ot `e`qual             | 不一致           |
| `[ int1 -lt int2 ]` | `l`ess `t`han             | `int1` < `int2`  |
| `[ int1 -le int2 ]` | `l`ess than or `e`qual    | `int1` <= `int2` |
| `[ int1 -gt int2 ]` | `g`reater `t`han          | `int1` > `int2`  |
| `[ int1 -ge int2 ]` | `g`reater than or `e`qual | `int1` >= `int2` |

### ファイル属性(よく使いそうなやつだけ)

| 演算子                  | 覚え方         | 真になる条件                         |
| ----------------------- | -------------- | ------------------------------------ |
| `[ -e file ]`           | `e` xists      | `file` が存在する                    |
| `[ -f file ]`           | `f` ile        | `file`が存在 かつ ファイルである     |
| `[ -d file ]`           | `d` ir         | `file`が存在 かつ ディレクトリである |
| `[ -s file ]`           | `s` ize        | `file`サイズが 0 より大きい          |
| `[ -h` or `[ -L file ]` | `L` ink        | `file`がシンボリックリンクである     |
| `[ -r file ]`           | `r` eadable    | `file`への読み取り権限がある         |
| `[ -w file ]`           | `w` ritable    | `file`への書き込み権限がある         |
| `[ -x file ]`           | e`x`ecutable   | `file`の実行権限がある               |
| `[ -O file ]`           | `O`wner        | `file`のオーナである                 |
| `[ file1 -nt file2 ]`   | `n`ewer `t`han | `file1`の更新時刻が`file2`より新しい |

### `&&`, `||`

+ `command1 && command2`: `command1`のステータスが0なら`command2`を実行して、そのステータスを返す
+ `command1 || command2`: `command1`のステータスが0以外なら`command2`を実行して、そのステータスを返す

`[ -n "$file" ] && [ -f "$file" ]` みたいな書き方ができる。 `-a` や `-o`より可読性が高いとされる。



## if

条件文のところにコマンドを書いて、コマンドの実行ステータス(`$?`)が 0 なら真、0 以外なら偽として分岐する。

```sh
if [ $(($1 % 3)) -eq 0 ] && [ $(($1 %  5)) -eq 0 ]; then
  echo Fizz Buzz
elif [ $(($1 %  3)) -eq 0 ]; then
  echo Fizz
elif [ $(($1 %  5)) -eq 0 ]; then
  echo Buzz
else
  echo $1
fi
```


## for

```sh
for dir in * # *.txt にマッチするフィルが無いとき、fileに *.txt がそのまま入っちゃうので注意！
do
  if [[ -d $dir ]]; then
    echo "$dir is dir."
  fi
done

# 1行でも書ける
for dir in *; do if [[ -d $dir ]]; then echo "$dir is dir."; fi; done
```

`break` と `continue` が使える。


## case
```sh
case $1 in
  *.txt)
    echo $1 is text
    ;;
  *.zip | *.tgz) # | で複数指定できる
    echo $1 is archived file
    ;;
  *)
    echo $1 is unknown file
    ;;
esac
```


## while と until
```sh
i=0
while [[ $i -lt 10 ]] # < だと文字列で比較しちゃうので -le を使う
do
  echo $i
  i=$((i+1))
done

i=0
until [[ $i -ge 10 ]] # until は逆
do
  echo $i
  i=$((i+1))
done
```


## リダイレクト
```sh
ls . > current_dir.txt # よくやるやつ

cat > hoge.txt
abcd
^d # ctrl-d

tr b B < hoge.txt # 標準入力
aBcd


# `n>&m` と書くと、FDのn番をm番のコピーにするという意味。
ls > log.txt 2>&1 # 標準エラー出力を標準出力と同じファイルへリダイレクトする
ls &> log.txt     # これでもOK

ls 2>&1 > log.txt # これはだめ。
# 標準出力先がlog.txtになる前、つまり出力先が端末になった状態で2>&1しているので、端末にエラー出力されちゃう

```


### noclobber: リダイレクトによる上書きを禁止できる
+ `set -o noclobber`: 上書きを禁止
+ `set +o noclobber`: 上書きを許可

```sh
echo "Hello" > hello.txt
echo "World" > hello.txt
cat hello.txt # World

set -o noclobber # 上書きを禁止
echo "Hello" > hello.txt # bash: hello.txt: cannot overwrite existing file
echo "Hello" >> hello.txt # 追記はできる
echo "Hoge" >|  hello.txt # >| で強制上書きできちゃう

set +o noclobber # 上書きを許可
echo "Hello" > hello.txt
cat hello.txt # Hello
```

続きはそのうち・・・