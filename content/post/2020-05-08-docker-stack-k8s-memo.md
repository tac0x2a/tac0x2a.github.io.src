---
title: "docker stackでk8sを使ってみるメモ"
date: 2020-06-08T20:28:19+09:00
draft: true
summary: '既存の docker-compose.yml で k8sにデプロイできると聞いて調べてみたメモ。'
---

## はじめに
`docker stack` コマンドで、既存の `docker-compose.yml` を使ってk8sにアプリをデプロイできると聞いて調べてみたメモ。

オンプレのクラスタ環境に自前アプリをデプロイする状況を想定。

## イメージのビルドとローカルregistryへの登録
`docker stack` というよりk8sはイメージのビルドをサポートしてないので、事前にビルドして、ローカルに立てたレジストリに登録、みたいなことが必要。


+ `docker-compose-registry.yml`
  ```yaml
  version: "3"
  services:
    # registry for built images refered from k8s
    registry:
      image: registry:2
      hostname: registry
      restart: always
      ports:
        - 5000:5000
  ```

+ `docker-compose-build.yml`
  ```yml
  version: "3"
  services:
    name-of-service:
      build:
        context: directory-name
      image: image-name
  ```
  必要な分だけビルドする

+ イメージの登録
  ```sh
  # Build
  docker-compose -f docker-compose-build.yml build

  # Regitry
  docker-compose -f docker-compose-registry.yml up -d

  docker image tag image-name localhost:5000/image-name
  docker push localhost:5000/image-name
  ```
  `registry` は永続化していないので、`docker-compose -f docker-compose-registry.yml down` で消える。


### ビルドしたイメージを参照する
k8sからは localhost:5000 として参照されるよう、ローカルリポジトリを指すようイメージを指定する。

+ `docker-compose.yml`
  ```yml
  version: "3"
  services:
    name-of-service:
      image: localhost:5000/image-name
      ...
  ```


## 動かしてみる

### デプロイ
```sh
docker stack deploy --orchestrator=kubernetes -c docker-compose.yml name-of-app
```

サービスごとにpodが作れられる。

ちなみに、以下のオプションは`docker stack`でサポートされていない。
+ build
+ cgroup_parent
+ container_name
+ devices
+ tmpfs
+ external_links
+ links
+ network_mode
+ restart
+ security_opt
+ userns_mode

参考: https://docs.docker.com/compose/compose-file/


### Ingress
注意: 結局動いていない。パスでサービスを解決したくなったら調査して追記する。


外部からサービスにアクセスするための口を作る。
参考: https://kubernetes.io/ja/docs/concepts/services-networking/ingress/

#### ingress-controller

まずingress-controllerを入れる。[いろいろある](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers)けど今回はingress-nginxを使う。
+ [Bare-metal](https://kubernetes.github.io/ingress-nginx/deploy/#bare-metal)の場合
  ```
  kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-0.32.0/deploy/static/provider/baremetal/deploy.yaml
  ```
  なんか色々入った。

#### ingressを適用する

+ `ingress.yml`
  ```yml
  WIP
  ```

+ 反映する
  ```
  kubectl apply -f ingress.yml
  kubectl get ingress
  ```

+ 確認する
  ```
  kubectl describe ingress name-of-ingress
  ```

ingressを削除するときは `kubectl delete ingress name-of-ingress`

### ボリュームについて
https://docs.docker.com/compose/compose-file/#volumes-for-services-swarms-and-stack-files

# トラブルシュート
```sh
kubectl describe pod name-of-pod
```


