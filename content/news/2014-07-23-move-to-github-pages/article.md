---
id: news-post
kind: article
article_type: news

title: 公式サイトを GitHub Pages へ移行しました
created_at: 2014-07-23T21:59
written_by: hidakatsuya
---

公式サイト www.thinreports.org を GitHub Pages へ完全に移行しました。  

移行した理由は以下の通りです。

  1. デプロイを自動化し <%= twitter :hidakatsuya %> のような特定のユーザだけでなく、コミュニティによる更新が可能な環境へ
  2. 旧ホスティングサーバのメンテナンス業からの解放

www.thinreports.org は、 Ruby 製静的サイトジェネレーター [nanoc](http://nanoc.ws/) によって管理されており、
そのソースコードは [GitHub](https://github.com/thinreports/thinreports.org) にて公開しています。サイトのリンク切れや間違いを見つけたら [こちら](https://github.com/thinreports/thinreports.org/issues/new) よりご報告いただけると嬉しいです。もちろん Pull Request もお待ちしております（近く、ローカル環境でのサイト開発、確認方法を含めた Pull Request 手順をまとめます）

また、サイトのソースコードや更新履歴は [thinreports.github.io](https://github.com/thinreports/thinreports.github.io) にて確認できます。
