---?color=#EFBB24
# @css[headline](APIサーバの構築)


---?gist=Yoosuke/a3b22fb6c27ef03d978d37bc80e88618&color=#000000
@[1](gismapという名前でプロジェクトを作成する)
@[3](Yを入力する)
@[7](gismapのディレクトリに移動する)
@[11](DBを作成する)
@[15](サーバーを起動する)

@snap[midopoint north-west text-06]
### プロジェクトファイルの生成
@snapend

---
@snap[north-west text-06]
### Webサーバの確認
@snapend

@snap[text-05]
ブラウザで「`http://localhost:4000`」にアクセス。<br>
Phoenixで作られたデフォルトのWebページが表示される事を確認しましょう。<br>
無事に見られたら、成功です。<br>

@img[span-60](template/img/environment/localhost4000.png)

@snapend

---
@snap[north-west text-06]
### サーバーの終了方法
Ctrl+C を2回打ちます。
@snapend

@img[span-60](template/img/Building-APIServer/1-ctr-c.png)

---

@snap[north-west text-06]
### JSONデータを作る

緯度と経度と名称を入れるためのJSONデータを作ります。<br>
CUIで以下のコマンドを打ちます。<br><br>

@color[#6F3381](mix phx.gen.json コンテキスト名 スキーマ名 スキーマ名の複数形　データ名：データ型)<br><br>

@gist[elixir zoom-50](Yoosuke/e18deaff49fd420a220bb338602160fc)

<br><br>このコマンドは、JSONリソースのcontroller, views, contextを生成します。<br>

詳しくは、[こちら](https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Gen.Json.html)のライブラリに記載されています。
@snapend

---?gist=Yoosuke/426e9d127ab84f72e0493874b7ddac77&color=#000000
@[3](ファイルに追加するのでコピーしておく)

@snap[north-west text-06]
### Router.exの設定
このコマンドは、CUIでは打ちません。<br>
エディタでファイルを開いて追記します。<br>
@snapend

---?terminal=template/sessions/start-up-code.json&color=#7FDBFF&font=small&title=Visual Studio Codeでファイルを開く
@snap[north-west text-06]
### Visual Studio Codeでファイルを開く
@snapend

---
@snap[north-west text-06]
### Router.exを編集する
@snapend

![Video](https://player.vimeo.com/video/311145345)

---?color=#333333
@snap[north-west text-06]
### Router.exの編集方法
@snapend

@snap[west text-05]

1. lib > gismap_web > router.ex をクリック<br>
2. 19行目と20行目の間に改行を入れる<br>
3. 「 `resources "/locations", LocationController, except: [:new, :edit]` 」と記入<br>
4. 8行目「plug :protect_from_forgery」の先頭に「 `#` 」を記入<br>
5. Control + S を打ってファイルを保存<br>

@snapend

---?color=#1E1F21
@code[elixir zoom-4](template/src/elixir/router.ex)
@[8](コメントアウト（コメント化してプログラム処理させないように）する)
@[20](ここに先ほどコピーした内容をペーストする)

@snap[north-west text-06]
### Router.exの編集方法
@snapend

---?color=#000000
@snap[north-west text-06]
### マイグレーション（データを移行）を実行
@snapend

@code[elixir midpoint zoom-10](template/src/elixir/migrate.ex)

---?color=#000000
@snap[north-west text-06]
### サーバの立ち上げ
@snapend

@code[elixir zoom-4 midpoint](template/src/elixir/start.ex)

@snap[south text-06]
Phoenixを起動
@snapend

---?terminal=template/sessions/start-server.json

---
@snap[north-west text-06]
### ブラウザで確認
localhost:4000で表示されていれば成功
@snapend

@img[span-60](template/img/Building-APIServer/5-localhost.png)

---
@snap[north-west text-06]
### RESTClientで GET、POST の動作確認
@snapend

![Video](https://player.vimeo.com/video/311154615)

---?color=#333333
@snap[north-west text-06]
### RESTClient を使ってデータを GET する①
@snapend

@snap[west text-05]

RESTClient の「 **Headers** 」メニューで、<br>
「 **Custom Header** 」を選択します。<br>
<br>
- Nameに **Content-Type** <br>
- Attribute Valueに **application/json** <br>
<br>
を入力します。

@snapend

---?color=#333333
@snap[north-west text-06]
### RESTClient を使ってデータを GET する②
@snapend

@snap[west text-05]
- Request の Method の所を「 **GET** 」にします。<br>
- URLに「 **`http://localhost:4000/locations`** 」を入力します。<br>
- 「 **SEND** 」 をクリックします<br>
<br>
*Request（リクエスト）とは：クライアントがデータの提供や処理を要求するメッセージ*<br>
*Method GETとは：要求する機能*<br>
*SENDとは：メッセージを送ること*
@snapend

---
@snap[north-west text-06]
### GET した結果を確認する
@snapend

@snap[midpoint text-05]
まだデータは何も入っていないので、<br>
Response メニューの 「 **Response** 」 タブの内容は<br>
次のような状態になります。<br>
<br>
```

{"data":[]}

```
<br>
<br>
*200 OKとは：　リクエストが成功した場合に返されるレスポンスコード*<br>
*Response（レスポンス）とは：　Webサーバーがクライアントからリクエストを受け取った結果をクライアントへ送信する応答*
@snapend

---?color=#333333
@snap[north-west text-06]
### RESTClientを使ってデータを POST する
@snapend

@snap[west text-05]
Request メニューの Method を「 **POST** 」に変更します。<br>
次に、**Body** に<br>
<br>
@color[#6F3381]({ "location": { "lat": 35.70822, "lng": 131.463398, "pointname": "test" } })<br>
<br>
を入力して 「 **SEND** 」をクリックします。<br>

@img[span-50](template/img/Building-APIServer/2-rest-post.png)

@snapend

---
@snap[north-west text-06]
### POST した結果を確認する
@snapend

@snap[text-05]
Response メニューの 「 **Response** 」 タブの内容は<br>
次のような状態になります。<br>
<br>
```

{"data":{"id":3, "lat":35.70822, "lng:"131.463398, "pointname:"test"}}

```
<br>
<br>
*201 Createdとは：　リクエストが成功してリソースの作成が完了したときに返されるレスポンスコード*
@snapend
