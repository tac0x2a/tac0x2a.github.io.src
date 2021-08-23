---
title: "TypeScript のメモ"
date: 2021-04-17T01:11:04+09:00
draft: false
summary: 'TypeScriptの色々を雑に思い出すためのメモ'
categories: ['tech', 'lang', 'memo']
---

# 変数とか
```ts
const personName:string = 'world';
console.log(`Hello ${1+1} ${personName}`);
//=> "Hello 2 world"

let n = 'hello';
n = n + ', world';
console.log(n);
//=> "Hello, world"

type ProgrammingLanguage = "Ruby" | "Python";
const lang: ProgrammingLanguage = "Japanese";
// Type '"Japanese"' is not assignable to type 'ProgrammingLanguage'.(2322)
console.log(lang);
//=> "Python"

let v: number;
console.log(v);
//=> undefined
v = null;
// Type 'null' is not assignable to type 'number'.(2322)
console.log(v)
// => null
```

数値(`number`)は全て64bitの浮動小数点型。
`bigint` は桁数制限のない整数で、`42n` のようなリテラル。
セミコロンは書いたほうが良いらしい。

```ts
function hello() {
    return "hello";
}
console.log(hello())
//=> "hello"

for (let i = 0; i < 10; i++) {
    console.log(i);
}
//=> 0 1 2 ...
```

```ts
//配列
const languages: string[] = ['Ruby', 'Python'];
languages.push('JavaScript', 'TypeScript')
console.log(languages, languages[3]);
//=> ["Ruby", "Python", "JavaScript", "TypeScript"],  "TypeScript"

console.log(languages.indexOf('JavaScript'), languages.includes('JavaScript'))
//=> 2, true
console.log(languages.indexOf('Java'), languages.includes('Java'))
//=> -1, false

const [rb, py, ...other] = languages;
console.log(rb, py, other)
//=> "Ruby",  "Python",  ["JavaScript", "TypeScript"]


const a: readonly number[] = [1, 2, 3]; //イミュータブルな型として
const b = [1, 2, 3] as const;           //イミュータブルな値として

//タプル
const movie: [string, number] = ['Gozilla', 1954];
console.log(movie[0])
//=> "Gozilla"

const r = 10;
const t = Math.PI * 0.5;
const pos: [number, number] = [r * Math.cos(r), r * Math.sin(r)];
console.log(pos)
//=> [-8.390715290764524, -5.440211108893697]


// スプレッド構文
console.log(...movie, movie)
//=> "Gozilla",  1954,  ["Gozilla", 1954]

function print(s: string, n: number){
    console.log(`Title:${s},Year:${n}`)
}
print(...movie)
//=> "Title:Gozilla,Year:1954"


// ループ
languages.forEach(v => {
    console.log(v);
})
//=> "Ruby"
//=> "Python"
//=> "JavaScript"
//=> "TypeScript"

for(const [i, v] of languages.entries()){
    console.log(i, v);
}
//=> 0,  "Ruby"
//=> 1,  "Python"
//=> 2,  "JavaScript"
//=> 3,  "TypeScript"
```

`...` はスプレッド構文というやつで、コレクション(for of で展開できるオブジェクト) を個々の値に展開できる。


タプルはインデックスでしかアクセスできないので可読性がいまいち。積極的に使う必要はない。
タプルを固定長の配列として使うこともできる。



```ts
const ruby = {
    title: 'Ruby',
    'first release': 1995,
    ['ext']: 'rb'
};

console.log(ruby.title); // "Ruby"
console.log(ruby['first release']); // 1995
console.log(ruby['ext']); //"rb"

const rbJson = JSON.stringify(ruby, null, 0)
console.log(rbJson)
//=> "{"title":"Ruby","first release":1995,"ext":"rb"}"
const rbOBj = JSON.parse(rbJson)
console.log(rbOBj)
//=> {
//=>   "title": "Ruby",
//=>   "first release": 1995,
//=>   "ext": "rb"
//=> }

const python: {title: string} = {
    title: "Python"
}
console.log(python)
//=> { "title": "Python" }

const merged = {...ruby, ...python}
console.log(merged);
//=> {
//=>   "title": "Python",
//=>   "first release": 1995,
//=>   "ext": "rb"
//=> }
```

次のようなクラスを定義するまでもない場面で使うらしい。
+ Web サービスのリクエストやレスポンス
+ 関数のオプショナルな引数
+ 複数の情報を返す関数
+ 複数の情報を返す非同期処理

辞書用途は、Mapを使うようにすること。

```ts
const map = new Map<string, string> ([
    ["Ruby", "rb"],
    ["Python", "py"]
]);
console.log(map, map.get('Ruby'));
//=> Map: {}, "rb"

for(const [key, value] of map) {
    console.log(`${key}:${value}`);
}
```


# 基本的な構文
+ `if`, `switch`,`while` は省略。 イテレータブルなオブジェクトは `for-of` を使う。

+ `===`, `!==` は厳密な比較、 `==`, `!=` は文字列に変換しての比較


# 型
TypeScriptは構造的部分型(structual subtyping)という型システムを採用している。
継承関係ではなく、オブジェクトが持ってるプロパティが互換しているかどうかに関心がある。


```ts
type Language = {
    name: string,
    year: number,
    ext?: string // ?がつくと省略可能
};

const java: Partial<Language> = {name: "java"}; // Partial<型>は、型の一部のみを持つ型を意味する

type Editor = {
    editorName: string,
    keybind: string
};

// 型を合成できる
const devenv: Partial<Language> & Editor = {
    name: "Ruby",
    editorName: "VSCode",
    keybind: "emacs"
};
```

合併型(`A | B`) は、AまたはBの型でなければならない、という意味。
交差型(`A & B`) は、AかつBの型でなければならない、両方の属性が含まれていないといけないという意味。

`type`(Type Alias)とよく似た機能で`interface`というのがある。

# 関数・メソッド
```ts
function join(s1: string, s2: string = "World") {
    return s1 + s2
};

const f: (s:string, h:string) => string = (s1: string, s2: string): string => {
    return s1 + s2
};

let joined: string = join("Hello");
console.log(joined); // "HelloWorld"

joined = f("hello", "world");
console.log(joined); //"helloworld"

const ruby = {
    getName() {
        return "Ruby"
    },

    _ext: "rb",
    get ext() {
        return this._ext;
    },
    set ext(e) {
        this._ext = e;
    }
}
console.log(ruby.getName(), ruby.ext) //=> "Ruby",  "rb"
ruby.ext = "RB"
console.log(ruby.ext) //=> "RB"
```


# クラスとインタフェース
```ts
class Language {
    private static  count: number = 0;

    protected readonly name: string;

    constructor(name: string, private exampleCode: string = "") {
        this.name = name;
        Language.count += 1;
    }

    hello(): string {
        return `Hello, ${this.name}`
    }

    example() {
        return this.exampleCode;
    }

    static langCount(){
        return Language.count;
    }
}

const ruby = new Language("Ruby", "puts 'Hello,World'");
console.log(ruby.hello()); //=> "Hello, Ruby"
console.log(ruby.example()); //=> "puts 'Hello,World'"

const java = new Language("Java", "System.out.println('Hello,World')")
console.log(Language.langCount()); //=> 2

interface Celebratable {
    happyBirthday(): string;
}

class LightWeightLanguage extends Language implements Celebratable{
    hello(): string {
        return `${super.hello()}. I'm Light Weight!`
    }

    happyBirthday() {
        return `Happy Birthday, ${this.name}`
    }
}

const python = new LightWeightLanguage("Python", "print('Hello,World')")
console.log(python.hello()); //=> "Hello, Python. I'm Light Weight!"
console.log(python.happyBirthday()) //=> "Happy Birthday, Python"
console.log(Language.langCount()); //=> 3
```

パット見た感じ、他の言語にだいぶ近く違和感なさそうでよかった。
