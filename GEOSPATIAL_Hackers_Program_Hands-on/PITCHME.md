---?color=#F79F79
@transition[none]
# @css[headline](GEOSPATIAL Hackers Program Hands-on)

---?color=#79F79F
# @css[headline](オープンデータを利用した地図アプリを作ろう!)

---

@snap[north-west]
## The Agenda
@snapend

@snap[south-west list-content-concise span-80]
@ol[list-bullets-black](true)
* WebGIS等 基礎知識
* 環境構築
- APIServerの構築
- 地図の表示
- 外部API呼び出し
- 内部API呼び出し
- DB操作
- 地図へのポイント追加
- 自分の緯度経度の取得
- 2点間の距離作成
- CSVデータの取り込み
@olend
@snapend

---?include=template/md/basic-knowlede-webgis/PITCHME.md
---?include=template/md/environment/PITCHME.md
---?include=template/md/Building-APIServer/PITCHME.md
---?include=template/md/Show-map/PITCHME.md
---?include=template/md/External-API-call/PITCHME.md
---?include=template/md/Internal-API-call/PITCHME.md
---?include=template/md/DB-operation/PITCHME.md
---?include=template/md/points-to-the-map/PITCHME.md
---?include=template/md/own-latitude-longitude/PITCHME.md
---?include=template/md/between-two-points/PITCHME.md
---?include=template/md/Capture-CSV-data/PITCHME.md

---
## モジュールの導入
#### [smallex](https://hex.pm/packages/smallex)

---
mix.exs

```elixir
#...省略

 defp deps do
    [
      {:phoenix, "~> 1.4.0"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_ecto, "~> 4.0"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:smallex, "~> 0.1.2"},    # <- 追加
    ]
  end

#...省略
```
@[15](smallexのモジュールを追加)

---
## 外部APIの取得

---

lib/App名_web/template/layout/app.html.eex
```html
<!DOCTYPE html>
<html lang="en">
  <head>
    //...省略
    <link rel="stylesheet" href="<%= Routes.static_path(@conn, "/css/app.css") %>"/>
    // 以下２行（Vue.jsのCDN、AxiosのCDN) を新たに追加
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.17/vue.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.min.js"></script>

    <script src="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.js"></script>
    //...省略
  </head>

```
@[6-8](Vue.jsとAxiosのCDNを追記)
---

## APIの作成
---

コンソール上で

```elixir

mix phx.gen.json Api Location locations lng:float lat:float pointname:string

```

---

```elixir
Add the resource to your :api scope in lib/test_web/router.ex:

    resources "/locations", LocationController, except: [:new, :edit]

Remember to update your repository by running migrations:

    $ mix ecto.migrate

```
@[3](lib/test_web/router.exに追記する)

---

lib/test_web/router.ex

```elixir
#...省略
  scope "/", TestWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/locations", LocationController, except: [:new, :edit] #<- 追加
  end
#...省略
```
@[6]
---

```elixir
Add the resource to your :api scope in lib/test_web/router.ex:

    resources "/locations", LocationController, except: [:new, :edit]

Remember to update your repository by running migrations:

    $ mix ecto.migrate

```
@[7](コンソールに戻り、migrateする)

---
```elixir
iex -S mix phx.server
```
@[1](コンソールからサーバーを起動します。)

---

REST APIクライアントを使って、データをインプットやアウトプットする
今回は、Firefoxの「RESTClient」を利用して説明します。
* [「Firefoxのダウンロード」](https://www.mozilla.org/ja/firefox/new/)はこちら
* [Firefox「RESTClient」](https://addons.mozilla.org/ja/firefox/addon/restclient/)
* [Chrome「Postman」](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop)

---

## 内部APIを呼び出し

---

## 表示
```html

<h1>Location</h1>
<table border="0">
<tr v-for="(result, index) in results">
    <td style="padding: 10px;">{{ result.lng }}</td>
    <td style="padding: 10px;">{{ result.lat }}</td>
    <td style="padding: 10px;">{{ result.pointname }}</td>
</tr>
</table>

<script>

    var app = new Vue
    ( {
        el: '#app',
        data:
        {
            results: [],
        },
        mounted()
        {
            axios.get( '/locations' )
            .then( response => { this.results = response.data.data } )
        },
    } )
</script>
```

---
## 追加・更新・削除の作成

```html
<h1>Location</h1>
<table border="0">
<tr v-for="(result, index) in results">
    <td style="padding: 10px;"><input type="text" v-model="result.lat"></td>
    <td style="padding: 10px;"><input type="text" v-model="result.lng"></td>
    <td style="padding: 10px;"><input type="text" v-model="result.pointname"></td>
</tr>
</table>
<button v-on:click="onUpdate">全件更新</button>

<script>

    var app = new Vue
    ( {
        el: '#app',
        data:
        {
            results: [],
        },
        mounted()
        {
            axios.get( '/locations' )
            .then( response => { this.results = response.data.data } )
        },
        methods:
        {
          onUpdate: async function( evt )
          {
            this.results.forEach( ( result, i ) =>
            {
              axios.put( '/locations/' + result.id,
              {
                  'location':
                  {
                    'lat': result.lat,
                    'lng': result.lng,
                    'pointname': result.pointname
                  }
              })
            })
          },
    } )
</script>
```

@[5-7]
@[10]
@[14-30]
---
## DB操作を作成

---

lib/util/db.ex
```elixir

defmodule Db do
  def query( sql ) when sql != "" do
    { :ok, result } = Ecto.Adapters.SQL.query( Test.Repo  , sql, [] )
    result
  end
  def columns_rows( result ) do
    result
    |> rows
    |> Enum.map( fn row -> Enum.into( List.zip( [ columns( result ), row ] ), %{} ) end )
  end
  def rows( %{ rows: rows } = _result ), do: rows
  def columns( %{ columns: columns } = _result ), do: columns
end

```
@[4](Test.Repoは自分のApp環境の名前に合わせる)

---

```SQL

# \dt

# SELECT * FROM locations;

```
@[4]
---
## Mapへのポイント追加との連携

---
## 2点間の距離を求める

---

lib/App名_web/template/layout/app.html.eex
```html

<!DOCTYPE html>
<html lang="en">
  <head>

    //...省略

    <script src="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.js"></script>
    //以下を追加
    <script src='//api.tiles.mapbox.com/mapbox.js/plugins/turf/v1.4.0/turf.min.js'></script>

    //...省略

  </head>

```
@[10]

---
利用サービス
* [leafletjs](https://leafletjs.com)
* [国土地理院](https://maps.gsi.go.jp)
* [TURF](http://turfjs.org/getting-started/)
* [Firefox「RESTClient」](https://addons.mozilla.org/ja/firefox/addon/restclient/)

---
利用技術の紹介
* [Elixir](https://elixir-lang.org/)
* [Phoenix](https://phoenixframework.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [Vue.js](https://jp.vuejs.org/index.html)

---
オープンデータ

---
参考情報
* [OpenStreetMap](https://openstreetmap.jp)
* [CART](https://carto.com/)
* [SPARQL](https://www.slideshare.net/uedayou/web-apisparql)
* [QGIS](https://www.qgis.org/)
* [地図tile](https://wiki.openstreetmap.org/wiki/JA:%E3%82%BF%E3%82%A4%E3%83%AB)
