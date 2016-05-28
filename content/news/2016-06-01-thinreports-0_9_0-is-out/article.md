---
id: news-post
kind: article
article_type: news

title: Thinreports 0.9.0 is out!
written_by: hidakatsuya
created_at: 2016-06-01T00:05
---

Thinreports 0.9.0 をリリースしました。1年ぶりのメジャーリリースです。

機能の追加はありませんが、内部的に大きな変更と、古い `.tlf` ファイルのサポート終了など、いくつかの注意が必要な変更が含まれます。

 * (Editor/Generator) New format for layout file
 * (Editor/Generator) Drop support for layout file created with Editor v0.7 or lower
 * (Editor) Release only ChromeApp ver
 * (Generator) Fixed a bug
 * (Generator) Remove some deprecated methods

詳しくは、それぞれの CHANGELOG [Generator](https://github.com/thinreports/thinreports-generator/blob/master/CHANGELOG.md) / [Editor](https://github.com/thinreports/thinreports-editor/blob/master/doc/CHANGELOG.md) をご覧ください。

### New format for layout file

`.tlf` ファイルが新しい形式で保存されるようになります。
新しい形式の詳細は [thinreports/thinreports#4](https://github.com/thinreports/thinreports/issues/4) をご覧ください。

#### Support Policy

 1. Editor v0.8 以前で保存された古い形式 (Old format)
 2. Editor v0.9 以降で保存された新しい形式 (New format)

| Thinreports   | 1-Old format | 2-New format |
| ------------- | :----------: | :----------: |
| <= v0.8       | Yes          | No           |
| v0.9 and v1.0 | Yes          | Yes          |
| >= v1.1       | No           | Yes          |

#### How to upgrade to new format

v0.9 or v1.0 の Editor を使って古い形式の `.tlf` ファイルを開き、
何らかの変更（図形を動かして元の位置に戻すだけでも良い）を加えて保存することで新しい形式へ変換することができます。

#### New Format Specification

https://github.com/thinreports/thinreports/wiki/Spec%3A-Layout-File%3A-Format

### Drop support for layout file created with Editor v0.7 or lower

Editor v0.7 以前で作成された `.tlf` ファイルは v0.9 以降で扱うことはできません。
v0.9 以降で扱うためには、Editor v0.8 で保存し直す必要があります。

#### How to confirm version of the layout file

`.tlf` ファイル内の `"version"` の値で確認できます。

~~~javascript
{"version":"0.7.7.2","finger-print":-1821469257,"config":{"title":"Example Barcode","option":{},"page" ... }
~~~

### 関連リンク

  * [Download](/download/)
  * [Installation Guide](/documentation/ja/getting-started/installation.html)
