---?color=#58B2DC
# @css[headline](Mapの表示)

---
@snap[north-west text-06]
### Mapを表示する
@snapend

@snap[text-05]

[reaflet.js](https://leafletjs.com/)というJavascriptの地図ライブラリを利用します<br>
@img[span-60](template/img/Show-map/leaflet.png)

@snapend

---
@snap[north-west text-06]
### Mapの設定方法
@snapend

![video](https://player.vimeo.com/video/311163533)

---?color=#232323
@snap[north-west text-06]
### 設定の解説
@snapend

@snap[midpoint]

@gist[html zoom-07](Yoosuke/71f36e00c2f8bb53d393bad8ec641f4b)

@[1,8](タグと呼ばれるマークアップ言語でタグとタグで囲んで記述していく)
@[2-4](headタグの中は、属性等を記載していく)
@[2-4](leaflet.jsのCDNはheadタグ内に記載する)
@[5-7](bodyタグの中に、ブラウザに表示したい内容を記載していく)
@[5-7](templates/page/index.html.eexの内容がbodyタグ内に書き込まれる)

@snapend

---?color=#232323
@snap[north-west text-06]
### Mapの設定方法
@snapend

@gist[html zoom-07](Yoosuke/37515f03b30f71e37048a5cff4e0ea74)

@[3-9](HTMLの属性情報などを記載する箇所)
@[10-29](ブラウザに表示される情報を記載する箇所)
@[26](index.html.eexの内容を書き込んでいる箇所)

---?color=#232323
@snap[north-west text-06]
### leaflet.jsの仕様
@snapend

@gist[js zoom-06](Yoosuke/073a29cd06b12ff1cb15f9aa83e659ab)

@[1](最初に表示する地点の緯度経度を記載する)
@[3](地図タイルのpngを設定する)
@[4](地図タイル提供元の情報を設定する)
@[7-8](地図にマッピングする緯度経度と名称の情報を設定する)
@[11-19](今回の入力例)

---?color=#232323
@snap[north-west text-06]
### leaflet.jsの表示領域の設定
@snapend

```<div>```タグの id="map" でmap属性が追加されたタグの<br>
縦横の表示領域をCSSで指定する<br>

```css
    <style>
      div#map{
          width: 100%;
          height: 500px;
      }
    </style>
```
---
@snap[north-west text-06]
### map表示の確認
@snapend

@img[zoom-07](template/img/Show-map/map_server.png)

---
