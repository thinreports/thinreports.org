---
id: news-post
kind: article
article_type: news

title: Change the official name
written_by: hidakatsuya
created_at: 2015-02-08T02:12
---

正式名称を ThinReports から **Thinreports** に変更しましたのでお知らせします。
`Reports` の `R` を大文字から小文字に変更しています。
すでに公式サイトや GitHub、ソーシャルアカウントなどへの対応が完了しています。
ロゴの変更はありません。

### Generator のモジュール名変更とその影響

[Generator](https://rubygems.org/gems/thinreports) は、
一般的に以下のように `ThinReports::` 名前空間（モジュール）を付けて利用されます。

~~~ruby
report = ThinReports::Report.new layout: 'foo.tlf'
~~~

次回リリース（0.8 を予定）にて、この名前空間である `ThinReports` についても `Thinreports` へ変更されますが、
次回リリースの段階では `ThinReports` を `Thinreports` のエイリアスとするため
引き続き `ThinReports::` を利用することができます。そのため、次回リリースへのアップグレードによって
既存のコードを変更する必要はありません。

しかし、その後のリリース（例えば 1.0）では `ThinReports` は **削除される予定です。**
