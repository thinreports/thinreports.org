---
id: news-post
kind: article
article_type: news

title: ThinReports の今後
created_at: 2014-08-10T10:13
written_by: hidakatsuya
---

ThinReports の今後についてまとめておきたいと思います。

### コミュニティ主導へ

これまで ThinReports ユーザの皆さんからたくさんの要望やバグ報告、そして中には PullRequest もいただきました。
そのおかげで、少しずつではありますが ThinReports も前に進むことができていると思います。ありがとうございます。

しかし、皆さんからいただいたたくさんの要望やご意見によって ThinReports に足りない機能や
改善が必要なところがはっきりしているにも関わらず、その開発が全く進んでいないという現状があります。

その主な原因を以下の通りと考えています。

  1. 主要な開発メンバーが二人しかいない（<%=tw :hidakatsuya %>, <%=tw :minoru_maeda %>）
  2. 帳票レイアウトファイルの仕様が非公開なので、開発に参加しづらい
  3. ドキュメントや公式サイトを上記二人以外が編集する術が無い
  4. 公式サイトやプロジェクトサイト [osc.matsukei.net](http://osc.matsukei.net) のサーバ保守作業がめんどう

(3)(4) は直接開発に関係無さそうですが、これらの作業が軽減あるいは無くなれば開発に専念するリソースを確保できますし、
(2) によって、主要メンバー以外でもコアな機能の開発や新しい機能の提案もしやすくなると思っています。

そして、以上によって OSS でありながらコミュニティの恩恵を受けにくい現状を改善し、
コミュニティ主導での活発な開発を目指したいと思っています。

既に完了あるいは進行中のものも含め、具体的には以下のような活動を行います。

#### 公式サイトを GitHub Pages へ

これは <%= link_to '2014-07-23: 公式サイトを GitHub Pages へ移行しました', '/news/2014/07/move-to-github-pages/' %>
でアナウンスしたように既に完了しています。これによって、サーバ保守から解放され、
PullRequest や Issues によって誰でもサイト更新に関わることができるようになりました。

#### Google Groups に Discussion Group を作成、旧フォーラムを廃止

これも <%= link_to '2014-07-02: 公式メーリングリストを作成しました', '/news/2014/07/02/official-mailing-list-now-ready/' %>
でアナウンスした通り既に完了しています。旧フォーラムに登録されていた方々には移行をお願いすることとなりご迷惑をおかけしました。

今回の移行は、旧フォーラムのあったプロジェクトサイト [osc.matsukei.net](http://osc.matsukei.net) の
閉鎖へ向けた対応の一つですが、もっと気軽に、もっとオープンに ThinReports に関するディスカッションができる場を作りたかったこと、
旧フォーラムではユーザの投稿したメッセージが他のユーザに通知されないなど改善が必要だったことが主な理由です。

#### ドキュメントサイトの GitHub Pages への移行と充実

ThinReports のドキュメントはプロジェクトサイト上で [日本語版](http://osc.matsukei.net/projects/thinreports/wiki) と [英語版](http://osc.matsukei.net/projects/thinreports/wiki/En_Overview)（by Pawit Khid-arn さん）を公開しています。
ただ、現在のドキュメントには二つの問題があると思っています。

一つ目は、 **ユーザがドキュメントを編集する簡単な手段がない** ことです。

今後、 [GitHub Pages](https://github.com/thinreports/documentation) へ移行することによって、
誰でも PullRequest によるドキュメントの追加や修正ができるようになります。
新しいドキュメントは [Jekyll](http://jekyllrb.com/) で管理し、内容は全て Markdown で記述します。
作成途中ですが、コードは [GitHub](https://github.com/thinreports/documentation) で確認することができます
（諸事情により、現在は実際のページを見る事ができません）

二つ目は、 **ドキュメントが貧弱すぎる点** です。

ThinReports で PDF を作成するためには、
Editor で作成したレイアウトを読み込み、値を埋め込んだり一覧表を作成するためのコードを書く必要があります。
しかし、現在のドキュメントには Generator の各 API の説明やサンプルコード、Tips がほとんどなく、
ちょっと複雑なことをしようとすると壁にぶち当たってしまうことが多いようです。
新しいドキュメントでは、現在のものに加えて API 周りのドキュメントを充実させます。

#### プロジェクトサイトの GitHub への移行

現在、プロジェクトサイト [osc.matsukei.net](http://osc.matsukei.net) から GitHub へチケットの移行を進めています。
既に現在のプロジェクトサイトは凍結され更新されることはありません（閲覧は可能です）今後は [Issues for Editor](https://github.com/thinreports/thinreports-editor/issues)、
[Issues for Generator](https://github.com/thinreports/thinreports-generator/issues)
それぞれで開発タスクやロードマップの管理をゆるく行います。バグ報告や機能の提案等はこちらからお願いします。

また、後述する ThinReports の内部仕様など、開発に関するドキュメントは
ThinReports のルートプロジェクト [github.com/thinreports/thinreports](https://github.com/thinreports/thinreports) の Wiki に集めます。

#### 内部仕様の公開

内部仕様というよりも、 `.tlf` ファイルのスキーマと言った方が良いかもしれませんが、
現在このレイアウトファイルの仕様を公開する準備を進めています。仕様は [ThinReports のルートプロジェクト](https://github.com/thinreports/thinreports)
の Wiki にまとめる予定です。仕様を知ることで ThinReports の仕組みを理解することができ、
コミュニティによる開発の促進や ThinReports を使った新たな OSS が生まれることを期待しています。

### ざっくりしたロードマップと今後

#### v1.0.0

現在、いくつか [ご報告いただいたバグがあるので](https://github.com/thinreports/thinreports-editor/issues/7) それは 0.7 系の bugfix としてリリースします。
その後は 1.0 として次の機能を開発していきます。

##### カスタムフォント

各方面より最も多くいただいている機能です。この機能によりビルトインフォント以外のフォントを ThinReports で利用することができるようになります。
ただ、内部ライブラリの制約により、利用できるフォントは TrueTypeFont `.ttf` に限られる予定ですが、
なんとか [Noto Sans CJK](http://www.google.com/get/noto/#/family/noto-sans-jpan) を
ThinReports で簡単に利用できるような仕組みも考えたいと強く思っています（ Nato Sans CJK は OpenTypeFont `.otf` 形式）

##### リスト機能の改善

改善というよりも "再構築" といった方が良いかもしれません。
現在のリスト機能は、そのアーキテクチャ自体に問題があります。
そのことが、新しい機能の実装や改善をしづらいものにしたり、 Generator の使い勝手にまで影響しています。
Generator については、Generator の API 設計にも問題がありますが。

具体的には、"再構築" によって以下のタスクを行います。

  * アーキテクチャの改善（再設計）
  * カスタムセクション機能
  * セクションの背景色の設定
  * ヘッダー/ページヘッダー
  * 異なるセクションのオブジェクト一括選択
  * Generator API の設計見直し

(6) の Generator API については、個人的には [Discussion Group](https://groups.google.com/forum/#!forum/thinreports) で
どうあるべきかについて、ユーザの皆さんの意見を貰ったり議論できないかな、と思ってたりします（たぶんやります）

##### Editor のプラットフォームに ChromeApp を採用

現在の Editor は Qt の QWebkit によるシンプルなブラウザ上で JavaScript/CSS3/HTML5 による Editor アプリを動作させるという仕組みになっています。
なので、そのブラウザを各プラットフォーム向けにビルドすることでマルチプラットフォーム対応を実現しています。

ただ、その "各プラットフォーム向けのビルド" が結構大変で、Editor をリリースする度に多くの時間リソースが必要な状態です。
また、それ以外にも Qt ベースの Editor には、技術的にも構造的にもいろいろな改善点があります。

そこで v1.0.0 では [ChromeApp](https://developer.chrome.com/apps/about_apps) ベースの Editor をリリースします。
というのも、Editor の [master](https://github.com/thinreports/thinreports-editor) では既に ChromeApp への移行を完了しています
（ただ、現状は ChromeApp 上で動くようにしただけの状態でまだまだ開発が必要な状態です）
これによって ChromeApp が動作するプラットフォームであればどれでも利用できるようになりますし、リソースの削減やアプリ自体がシンプルになるなど、
さまざまな問題を解決できるのではと考えています。

#### ThinReports Generator for PHP

リリース当初から "PHP 版ないの?" という要望をいただいていることもあり、今年の秋を目処に PHP 版 Generator の開発着手を予定しています。

実は私自身も、元々 PHP で業務アプリを作ってたりしたので、PHP での帳票開発の苦労は多少分かっているつもりです。
ただ、それも数年前の話ですので、その辺りの話を現在の PHP ユーザの方々から聞いてみたいと思っています。

そこで、今年の 10/11 に開催される [PHP Conference 2014](http://phpcon.php.gr.jp/w/2014/) に参加し、PHP ユーザの方々と情報交換できればと思っています。
また、Generator for PHP に賛同し一緒に開発してくれる PHPer を探すことも参加目的の一つです。

### その他の展開

#### レイアウトファイルの共有

これは ThinReports そのものの話ではないのですが、 API 経由で ThinReports を利用できる [REPOTEN-API](http://repoten-api.net/) で
テンプレートをシェアできる機能を構築する予定があるようです。
イメージ的には、各ユーザが公開しているテンプレートをショーケースのように閲覧できて、
ダウンロードしたり API から使ってみることができるような感じでしょうか。

これについては、今後 [REPOTEN-API](http://repoten-api.net/) や [公式ブログ](http://repoten.tumblr.com/) 、
<%=tw :repoten_team %> をチェックして下さい。
