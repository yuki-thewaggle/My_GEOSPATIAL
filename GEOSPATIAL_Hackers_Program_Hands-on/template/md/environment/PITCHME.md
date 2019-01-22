---?color=#F39F39
# @css[headline](環境構築)

---
@snap[midopoint north-west text-06]
### 準備するもの
@snapend

1. Rest APIクライアント
2. テキストエディタ
3. Elixir
4. node.js
5. PostgreSQL
6. Phoenixframework

---
@snap[north-west text-06]
### Rest APIクライアント
@snapend

@snap[midopoint text-05]
今回は、Firefox 「RESTClient」 を利用します。<br>
[RESTClient](https://addons.mozilla.org/ja/firefox/addon/restclient/) を [Firefox](https://www.mozilla.org/ja/firefox/new/?utm_campaign=non-fx-button&utm_content=rta%3Ae2FkMGQ5MjVkLTg4ZjgtNDdmMS04NWVhLTg0NjM1NjllNzU2ZX0&utm_medium=referral&utm_source=addons.mozilla.org) で開き、ダウンロードしてインストールしてください。<br>

@img[span-70](template/img/environment/RestClient-add.png)
@snapend
---
@snap[north-west text-06]
### テキストエディタ①
@snapend

@snap[midopoint text-05]
テキストエディタは、普段ご利用のものをお使いください。<br>
この講座では [Visual Studio Code](https://code.visualstudio.com/) を利用しています。<br>

@img[span-70](template/img/environment/vscode.png)

@snapend

---
@snap[north-west text-06]
### テキストエディタ②
@snapend

@snap[midopoint text-05]
Visual Studio Code に [Elixirのアドイン](https://marketplace.visualstudio.com/items?itemName=mjmcloug.vscode-elixir) を追加します。<br>

@img[span-70](template/img/environment/vscode-elixir.png)
@snapend

---
@snap[north-west text-06]
### テキストエディタ③
@snapend

@snap[midopoint text-05]
CUIからエディタを起動するための設定をします。<br>
Visual Studio Codeを開いた状態で<br>
Command + Shift + P で検索窓を開きます。<br>

@img[span-70](template/img/environment/vscode-adin.png)
@snapend
---
@snap[north-west text-06]
### テキストエディタ④
@snapend

@snap[text-05]
「Shell Command: install 'code' command in PATH」を選択します。<br>
@img[span-90](template/img/environment/vscode-shell.png)
@snapend

---
@snap[north-west text-06]
### CUI
@snapend

@snap[text-05]
CUIとは:コマンドベースの入力インターフェイス<br>
WindowsとMacでは、利用するアプリや利用するコマンドが若干異なります。<br>
＊ Windows->コマンドプロンプト<br>
＊ Mac->ターミナル<br>

@img[span-60](template/img/environment/terminal.png)
@snapend

---?gist=Yoosuke/ef45e8a06367c20cff7b4a46714fbd12&color=#000000
@[3](現在のフォルダの中を表示する（Macの場合）) 
@[5](現在のフォルダの中を表示する（Windowsの場合）) 
@[8](フォルダを作成する)
@[11](フォルダを移動する)

@snap[north-west text-06 text-white]
### ターミナルの使い方
現在のフォルダ内にある内容を確認します。
@snapend

---?gist=Yoosuke/6d2cfefcc23d71cf0911074a99787e88&color=#000000
@[2,5](Visual Studio Codeを立ち上げる)

@snap[north-west text-06 text-white]
### CUIからエディタを起動する方法
Visual Studio Codeが起動すればOKです。
@snapend

---
@snap[north-west text-06]
### Elixirのインストール
@snapend

@snap[text-05]
今回は Elixir という言語を利用しますので、お使いの環境に合わせて<br>
[インストール](https://elixir-lang.org/install.html) してください。<br>
elixirに必要なパッケージ類も一緒にインストールされます。<br>

@img[span-60](template/img/environment/elixir-hp.png)


@snapend
---
@snap[north-west text-06]
### HomeBrewのインストール for Mac
@snapend

@snap[midpint text-07]
Macの場合は [homebrew](https://brew.sh/index_ja) を使用すると便利です。　<br>
インストール方法は次で説明します。<br>

@img[span-60](template/img/environment/elixir-install-mac.png)<br>


@snapend

---?gist=Yoosuke/0abcd22f59dc8cc7c0db4509aa358253&color=#000000
@[1](HomebrewをUpdateする)
@[2](Elixirをインストールする)

@snap[north-west text-06]
### Elixirのインストール for Mac
homebrew からElixirをインストールします。
@snapend

---
@snap[north-west text-06]
### Elixirのインストール for Windows
@snapend

@snap[midpoint text-06]
[Download the installer](https://elixir-lang.org/install.html#windows) より<br>
ダウンロードします。<br>

@img[span-90](template/img/environment/elixir-install-win.png)<br>

@snapend

---
@snap[north-west text-06]
### node.jsのインストール
@snapend

@snap[text-05]
[nodejs](https://nodejs.org/en/download/) の LTS（推奨版） をダウンロードします。<br>

@img[span-70](template/img/environment/nodejs.png)<br>

@snapend

---
@snap[north-west text-06]
### PostgreSQLのインストール
@snapend

@snap[text-05]
今回は、[PostgreSQL version 11.1](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads) をダウンロードします。<br>
セットアップウィザードのパスワードには *postgres* を設定します。<br>

@img[span-60](template/img/environment/postgresql.png)
@snapend

---
@snap[north-west text-06]
### Phoenix Frameworkのインストール①
@snapend

@snap[text-05]
Webのフレームワークとして、[Phoenix](https://phoenixframework.org/) を利用します。<br>
インストール方法は次で説明します。<br>

@img[span-70](template/img/environment/phoenix.png)

@snapend

---?gist=Yoosuke/02ec19b92d74e666fd6e47e7095dfd9c&color=#000000
@[1](Phoenix v1.4をインストールする)

@snap[north-west text-06 text-white]
### Phoenix Frameworkのインストール②
CUIからコマンドを入力してPhoenix v1.4をインストールします。
@snapend
