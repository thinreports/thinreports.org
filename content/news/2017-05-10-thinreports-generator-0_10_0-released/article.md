---
id: news-post
kind: article
article_type: news

title: Thinreports Generator 0.10.0 released
written_by: hidakatsuya
created_at: 2017-05-10T02:25
---

Thinreports Generator 0.10.0 をリリースしました。

サポートする Ruby の変更と、いくつかの重要な内部的な変更が含まれています。

  * Thinreports requires Prawn 2.2
  * Dropped Ruby 1.9.3 and 2.0.0 support
  * Fixed a bug line-height of a text line-wrapped is broken
  * Remove deprecated top-module `ThinReports`
  * Remove `config.convert_palleted_transparency_png` option
  * Remove `config.generator.default` option
  * Deprecate `:report` and `:generator` argument of `Thinreports::Report.generate`

詳細は [CHANGELOG](https://github.com/thinreports/thinreports-generator/blob/master/CHANGELOG.md#0100) をご覧ください。

### 互換性

Editor 0.8.0 以降で作成・編集されたレイアウトファイルに対応しています。

### Editor のリリースについて

Thinreports Editor 0.10.0 についても、後日リリースする予定です。
