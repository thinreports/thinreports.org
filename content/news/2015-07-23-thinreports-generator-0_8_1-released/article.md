---
id: news-post
kind: article
article_type: news

title: Thinreports Generator 0.8.1 Released
written_by: hidakatsuya
created_at: 2015-07-23T02:04
---

Thinreports Generator 0.8.1 をリリースしました。

このリリースには以下の新機能が含まれています。

  * [#32](https://github.com/thinreports/thinreports-generator/pull/32) Add OPTIONAL feature for converting a pallete-based PNG w. transparency

### Add OPTIONAL feature for converting a pallete-based PNG w. transparency

この機能は、一部の透過 PNG の透明部分が正しく描画されない問題を解決するための機能です。
具体的には、 [#32](https://github.com/thinreports/thinreports-generator/pull/32) にあるような PNG8 形式の PNG が該当します。

なお、この機能を **デフォルトでは無効** になっているため、使いたい場合は下記の設定によって有効化する必要があります。

~~~ruby
Thinreports.config.convert_palleted_transparency_png = true
~~~

また [#32](https://github.com/thinreports/thinreports-generator/pull/32) で説明している通り、
この機能を有効にすると、PDF 生成で使用するすべての PNG 画像に対して、チェックと（該当するなら）変換処理が行われるため、
機能が無効な状態に比べてパフォーマンスが低下する場合があります。特に、PNG 画像を多く使っている場合は注意が必要です。

### 関連リンク

  * [Pull Request #32](https://github.com/thinreports/thinreports-generator/pull/32)
  * [CHANGELOG](https://github.com/thinreports/thinreports-generator/blob/master/CHANGELOG.md)
