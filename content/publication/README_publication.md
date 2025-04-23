---
draft: true
---

# 研究業績の登録方法

このドキュメントでは、研究グループのウェブサイトにおける研究業績の登録と管理方法について説明します。各研究業績は`content/publication/`ディレクトリの下に、日付と著者名を含むディレクトリを作成し、その中に`index.ja.md`と`index.en.md`ファイルを作成する必要があります。

## ディレクトリ構造

```
content/publication/
├── YYYYMMDD-conf-author/  # 日付-会議名-著者名のディレクトリ　（新しく作成する）
│   ├── index.ja.md        # 研究業績の詳細情報（日本語）
│   └── index.en.md        # 研究業績の詳細情報（英語）
├── _index.ja.md           # 日本語トップページ （このファイルは変更しない）
├── _index.en.md           # 英語トップページ （このファイルは変更しない）
└── README_publication.md  # このドキュメント
```

## 必須項目と任意項目

研究業績の登録には以下の項目が含まれます：

### 必須項目
- 基本情報（`title`, `authors`, `date`, `publication_types`, `category_types`）
- 概要（`abstract`）

### 任意項目
- プロジェクト情報（`projects`）
- タグ（`tags`）　（関連するキーワード：["Care", "DX", "Technology", "HCI"]）
- 画像（`image`）
- リンク（`url_pdf`, `url_code`, `url_dataset`, `url_poster`, `url_slides`, `url_video`, `url_source`）
- メモ（`note`）

## ファイルの作成方法

1. 新しい研究業績用のディレクトリを作成
   - 命名規則: `YYYYMMDD-conf-author`
   - 例: `20240926-asd-omata`

2. ディレクトリ内に`_index.md`ファイルを作成し、以下のテンプレートを使用：

```yaml
---
title: "論文タイトル"
authors: # authorsのフォルダ名と一致させる（例：atsushi-omata）
  - admin # 石川先生はadminというフォルダ名で管理されている．
  - その他の著者
date: "2024-09-26" # 発表した日付 or 出版された日付
publication_types: ["paper-conference"]  # 出版タイプ（↓の表参照）
category_types: ["International Conference"]     # カテゴリタイプ（↓の表参照）
projects: ["プロジェクト名"] # プロジェクト名はprojectsのフォルダ名と一致させる（例：care-dx）
tags: ["タグ1", "タグ2"]
image:
  caption: "画像の説明"
  focal_point: "Center"
  preview_only: false
url_pdf: "PDFファイルのURL"
url_code: "コードのURL"
url_dataset: "データセットのURL"
url_poster: "ポスターのURL"
url_slides: "スライドのURL"
url_video: "動画のURL"
url_source: "ソースのURL"
abstract: "論文の概要"
note: "追加のメモ"
---
```

## 出版タイプ（publication_types）

| 番号 | タイプ名          | 日本語訳           | 用途の例                       |
| ---- | ----------------- | ------------------ | ------------------------------ |
| 1    | article-journal   | 学術雑誌論文       | 学術論文、査読付き論文など     |
| 2    | article-magazine  | 雑誌記事           | 一般雑誌の記事（Time誌など）   |
| 3    | article-newspaper | 新聞記事           | 新聞記事                       |
| 4    | book              | 書籍               | 単行本、書籍全体               |
| 5    | chapter           | 書籍の一章         | 編著書の中の一章               |
| 6    | thesis            | 学位論文           | 修士論文、博士論文など         |
| 7    | paper-conference  | 会議・学会発表論文 | カンファレンスの論文や発表など |
| 8    | webpage           | ウェブページ       | Web サイトの記事やページ       |
| 9    | report            | 報告書             | 技術報告書、政府報告書など     |
| 10   | manuscript        | 原稿               | 出版前の草稿                   |
| 11   | dataset           | データセット       | 公開データ、研究データなど     |
| 12   | software          | ソフトウェア       | GitHub上のコード、ツールなど   |
| 13   | patent            | 特許               | 特許文書                       |
| 14   | interview         | インタビュー       | 誰かへのインタビュー           |
| 15   | speech            | スピーチ／講演     | 公演、プレゼンなど             |
| 16   | broadcast         | 放送               | テレビ・ラジオ番組             |
| 17   | article           | Preprint           | プレプリント                   |

## カテゴリタイプ（category_types）

| 番号 | タイプ名                 | 日本語訳               | 用途の例                                 |
| ---- | ------------------------ | ---------------------- | ---------------------------------------- |
| 1    | Domestic Conference      | 国内学会発表           | 日本国内での学会、シンポジウムでの発表   |
| 2    | International Conference | 国際学会発表           | 海外または国際会議での口頭・ポスター発表 |
| 3    | Journal Paper            | 学術雑誌論文           | 査読付き学術雑誌への掲載論文             |
| 4    | Poster Presentation      | ポスター発表           | ポスター形式での発表（国内・国際問わず） |
| 5    | Technical Report         | 技術報告書             | 技術的な調査・開発報告書                 |
| 6    | Preprint                 | プレプリント           | ArXivなどに投稿した査読前の論文          |
| 7    | Award                    | 受賞                   | 発表賞、学会賞、学生賞など               |
| 8    | Press Release            | プレスリリース         | メディア掲載、広報発表                   |
| 9    | Media Coverage           | メディア掲載           | 新聞、Web記事、TVなどへの掲載            |
| 10   | Outreach                 | 社会連携・アウトリーチ | 一般向け講演、イベント参加、教育活動など |
| 11   | Invited Talk             | 招待講演               | 他大学・学会等からの招待講演             |
| 12   | Thesis                   | 学位論文               | 卒業論文、修士論文、博士論文             |
| 13   | Software Release         | ソフトウェア公開       | 自作ツール・ライブラリのGitHub等での公開 |
| 14   | Dataset Release          | データセット公開       | 研究で使用したデータの公開               |

## トラブルシューティング

- YAML構文が正しいことを確認（適切なインデント、タブなし）
- 必須フィールドがすべて記入されていることを確認
- リンクが機能することを確認
- 出版タイプとカテゴリの番号が正しいことを確認 