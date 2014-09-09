---
id: news-post
kind: article
article_type: news

title: Editor 0.7.7.2 released
written_by: hidakatsuya
created_at: 2014-08-13T18:46
---

ThinReports Editor 0.7.7.2 をリリースしました。

Editor の 3 件のバグを修正しています。Generator のリリースはありません。

  * [#7](https://github.com/thinreports/thinreports-editor/issues/7) 用紙のサイズで `user` を使用して作成した `.tlf` が使用できない
  * [#8](https://github.com/thinreports/thinreports-editor/issues/8) The format of the PageNumber tool is not copied
  * [#9](https://github.com/thinreports/thinreports-editor/issues/9) When paper type is `user`, paper orientation is not applied

用紙サイズが `user` のとき PDF 生成時にエラーが発生するバグ `#7` については、
レイアウトファイルを 0.7.7.2 で開き、保存しなおすことで解決できます。

**関連リンク:**

  * [ChangeLog](https://github.com/thinreports/thinreports-editor/blob/master/CHANGELOG.md)
  * [Download](/download/)
