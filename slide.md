# シェル芸練習用のDockerイメージ作ってみた

Hisaharu Ishii

---

## Who am I

* Hisaharu Ishii (@hisaharu)
* おしごと: 通信会社の研究所
  * Docker, SDN, OpenStack...
* 趣味: シェル芸

---

## 勉強会あるある

* 最近は少ないが、過去のシェル芸勉強会ではよく見た光景
* 会長「第1問はこちら。やってみて下さい」
* 参加者「持ってきたPCはWindowsなので、VirtualBoxにLinuxをインストールして...」
* すぐに問題を始められないのはもったいない

---

## シェル芸の環境差分

* いまだによくある光景
* Mac(BSD)なのでcoreutils入ってなくてコマンド/オプションが違う
* Tukubaiの解答例を見て試してみたいけど時間が...

---

## さいきんのニュース

![Arukas logo](images/arukas1.png)

---

## コンテナホスティングサービス Arukas by さくらインターネット


2016年4月27日
さくらインターネット株式会社

さくらインターネット株式会社は、Docker, Inc.が開発するコンテナ型仮想化技術「Docker」を利用した新たなホスティングサービス「Arukas（アルカス）」を開発しました。
この「Arukas」を無料でご利用いただけるオープンβテストを、2016年9月末まで実施いたします。


![Arukas UI](images/arukas2.png)

---

## そうだ！


　　　 ｜
　 ＼　＿　／
　＿　(ｍ)　＿
　　　 目　　　ﾋﾟｺｰﾝ
　 ／　`′ ＼
　　　∧_∧
　　 (･∀･∩
　　 (つ　ノ
　　 ⊂＿ノ
　　　 (_)


---

## シェル芸練習用Dockerイメージ

* シェル芸に必要なコマンド一式をDockerコンテナにまとめる
  * Ubuntu 16.04
  * git
  * 勉強会で使ってるデータ(ShellGeiData)
  * Open USP Tukubai
* コンテナ内でsshdが起動するようにしておく
  * SSHの公開鍵は環境変数で指定する
* Arukasでコンテナを起動する
  * 危険シェル芸やり放題！！！

---

## Dockerfile


FROM ubuntu
WORKDIR /root
EXPOSE 22
CMD /sshd.sh
ADD sshd.sh /sshd.sh
RUN : \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
      openssh-server \
      ca-certificates \
      git \
      make \
 && git clone https://github.com/ryuichiueda/ShellGeiData \
 && git clone https://github.com/usp-engineers-community/Open-usp-Tukubai \
 && cd Open-usp-Tukubai \
 && make install \
 && :


---

## やってみる

Demo

---

## ところで

このスライドですが...

---

## Slideck by ゆーすけべーさん を使ってみました

![Slideck](https://raw.githubusercontent.com/yusukebe/slides/master/images/slideck_ss.png)

Markdownを書いてGitHubに上げる -> スライドになる
Cool!!!

---

## 参考資料

* [このスライドのソース](https://github.com/hisaharu/shellgei/blob/master/slide.md)
* [シェル芸練習用Dockerイメージ](https://hub.docker.com/r/hisaharu/shellgei)
* [Dockerfile](https://github.com/hisaharu/shellgei/blob/master/Dockerfile)
* [Slideck](https://slideck.io/)
* [Arukas](https://arukas.io/)

