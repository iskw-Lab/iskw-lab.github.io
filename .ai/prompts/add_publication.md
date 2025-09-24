# 業績追加プロンプト

このプロンプトは、研究室Webサイトに新しい業績を追加するための自動化支援ツールです。業績情報をリスト形式で受け取り、既存の業績リストに適切に追加・更新することができます。

## 前提条件

- 業績情報は以下の形式でリスト提供されることを想定しています：
  ```
  - タイトル: [日本語タイトル] / [英語タイトル]
  - 著者: [第一著者], [共著者1], [共著者2], [指導教員]
  - 発表日: YYYY-MM-DD
  - 会議名: [会議正式名称] / [会議略称]
  - 種別: [paper-conference/article-journal/thesis など]
  - カテゴリ: [Domestic Conference/International Conference など]
  - プロジェクト: [関連プロジェクト名]
  - タグ: [キーワード1], [キーワード2]
  - DOI: [DOI番号（任意）]
  - PDF URL: [論文PDF URL（任意）]
  - その他の情報: [任意]
  ```

## 処理手順

### 1. 既存構造の確認

まず、以下のディレクトリ構造を確認してください：
```
content/publication/
├── YYYYMMDD-conf-author/   # 日付-会議名-著者名のディレクトリ
│   ├── index.ja.md         # 日本語版業績情報
│   ├── index.en.md         # 英語版業績情報
│   └── cite.bib           # BibTeX情報（任意）
├── _index.ja.md           # 日本語トップページ（変更禁止）
├── _index.en.md           # 英語トップページ（変更禁止）
└── README_publication.md  # 詳細ドキュメント
```

### 2. ディレクトリ名の生成

新業績のディレクトリ名は以下のルールで生成してください：
- 形式: `YYYYMMDD-[会議略称]-[第一著者名]`
- 例: `20240531-jsai-atsushi-omata`、`20240926-asd-keita-hirobe`
- 日付は発表日または出版日を使用
- 会議略称は小文字で統一
- 著者名は `content/authors/` のフォルダ名と一致させる

### 3. ディレクトリとファイルの作成

各新業績に対して以下を実行：

1. `content/publication/[directory-name]/` ディレクトリを作成
2. 既存業績をテンプレートとしてコピー（推奨: 同じ種別の最新業績）
3. 日本語版（`index.ja.md`）と英語版（`index.en.md`）を作成
4. 必要に応じて `scripts/create_publication.sh` スクリプトを活用

### 4. 業績情報の更新

#### 必須フィールド

**日本語版 (`index.ja.md`)**:
```yaml
---
# 論文タイトル（日本語）
title: "[日本語タイトル]"

# 著者リスト（content/authors/ のフォルダ名と一致）
authors:
  - [第一著者username]  # 例: atsushi-omata
  - [共著者名]          # 例: yuka-enomoto
  - admin              # 石川先生は常にadmin

# 発表・出版日時
date: 'YYYY-MM-DDTHH:MM:SSZ'
publishDate: 'YYYY-MM-DDTHH:MM:SSZ'

# DOI（任意）
doi: '[DOI番号]'

# 出版タイプ（README_publication.md参照）
publication_types: 
  - paper-conference    # 会議発表論文
  # - article-journal   # 学術雑誌論文
  # - thesis            # 学位論文

# カテゴリ（複数選択可能、README_publication.md参照）
categories:
  - Domestic Conference      # 国内学会
  # - International Conference # 国際学会
  # - Journal Paper          # 学術雑誌論文
  # - Poster Presentation    # ポスター発表

# 出版情報
publication: In *[会議正式名称]*
publication_short: In *[会議略称]*

# 論文概要
abstract: "[日本語概要]"

# サマリー
summary: [会議正式名称]にて発表しました。

# 関連プロジェクト（content/project/ のフォルダ名）
projects:
  - [プロジェクト名]  # 例: llm-self-care, care-dx

# タグ・キーワード
tags:
  - [キーワード1]
  - [キーワード2]

# フィーチャー設定
featured: false

# リンク情報
links:
- name: [会議正式名称]
  url: [会議URL]

# 画像設定
image:
  caption: ""
  focal_point: ""
  preview_only: false

# URL設定（任意）
url_pdf: "[PDF URL]"      # 論文PDF
url_slides: ""            # スライド
url_video: ""             # 動画
url_code: ""              # コード
url_dataset: ""           # データセット
url_project: ""           # プロジェクト
---
```

**英語版 (`index.en.md`)**:
```yaml
---
# 論文タイトル（英語）
title: "[English Title]"

# 著者リスト（日本語版と同一）
authors:
  - [第一著者username]
  - [共著者名]
  - admin

# 日時（日本語版と同一）
date: 'YYYY-MM-DDTHH:MM:SSZ'
publishDate: 'YYYY-MM-DDTHH:MM:SSZ'

# DOI（日本語版と同一）
doi: '[DOI番号]'

# 出版タイプ（日本語版と同一）
publication_types: 
  - paper-conference

# カテゴリ（日本語版と同一）
categories:
  - Domestic Conference

# 出版情報（英語表記）
publication: In *[Conference Official Name]*
publication_short: In *[Conference Abbreviation]*

# 論文概要（英語）
abstract: "[English Abstract]"

# サマリー（英語）
summary: We presented at [Conference Official Name].

# プロジェクト（日本語版と同一）
projects:
  - [プロジェクト名]

# タグ（日本語版と同一）
tags:
  - [キーワード1]
  - [キーワード2]

# その他設定（日本語版と同一）
featured: false

links:
- name: [Conference Official Name]
  url: [Conference URL]

image:
  caption: ""
  focal_point: ""
  preview_only: false

url_pdf: "[PDF URL]"
url_slides: ""
url_video: ""
url_code: ""
url_dataset: ""
url_project: ""
---
```

#### 重要な設定ルール

1. **著者名の設定**:
   - 必ず `content/authors/` のフォルダ名と一致させる
   - 石川先生は常に `admin` として記載
   - 外部著者は姓名をスペース区切りで記載（例: "増川 ねてる"）

2. **出版タイプ（publication_types）**:
   - `paper-conference`: 会議・学会発表論文
   - `article-journal`: 学術雑誌論文  
   - `thesis`: 学位論文
   - その他は `content/publication/README_publication.md` を参照

3. **カテゴリ（categories）**:
   - `Domestic Conference`: 国内学会発表
   - `International Conference`: 国際学会発表
   - `Journal Paper`: 学術雑誌論文
   - `Poster Presentation`: ポスター発表
   - その他は `content/publication/README_publication.md` を参照

4. **プロジェクト名**:
   - `content/project/` のフォルダ名と一致させる
   - 例: `llm-self-care`, `care-dx`, `care-interaction`

5. **日時の形式**:
   - ISO 8601形式: `YYYY-MM-DDTHH:MM:SSZ`
   - 例: `2024-05-31T00:00:00Z`

### 5. スクリプトの活用

既存の `scripts/create_publication.sh` を使用してテンプレート生成も可能：
```bash
./scripts/create_publication.sh [会議略称] [著者名]
# 例: ./scripts/create_publication.sh jsai atsushi-omata
```

スクリプト実行後、生成されたテンプレートを上記ルールに従って編集してください。

### 6. 動作確認

1. Hugo開発サーバーで確認:
   ```bash
   hugo server -D
   ```
2. ブラウザで `http://localhost:1313` にアクセス
3. Publicationsセクションで新しい業績が正しく表示されることを確認
4. 日本語・英語両方のページで確認

### 7. 実装例

**入力例**:
```
業績リスト:
- タイトル: ナレッジグラフとLLMの連携による概念獲得支援チャットボットの開発 / Development of Concept Acquisition Support Chatbot Empowered by Knowledge Graphs and Large Language Models
- 著者: atsushi-omata, yuka-enomoto, 増川 ねてる, admin
- 発表日: 2024-05-31
- 会議名: 2024年度人工知能学会全国大会（第38回） / The 38th Annual Conference of the Japanese Society for Artificial Intelligence, 2024
- 種別: paper-conference
- カテゴリ: Domestic Conference, Poster Presentation
- プロジェクト: llm-self-care
- タグ: LLM, ナレッジグラフ, チャットボット
- DOI: 10.11517/pjsai.JSAI2024.0_4Xin2106
- PDF URL: https://confit.atlas.jp/guide/event/jsai2024/subject/4Xin2-106/detail?lang=ja
```

**処理結果**:
1. `content/publication/20240531-jsai-atsushi-omata/` ディレクトリ作成
2. `index.ja.md` 作成（日本語版業績情報）
3. `index.en.md` 作成（英語版業績情報）
4. 必要に応じて `cite.bib` 作成

## 参考資料

- `content/publication/README_publication.md`: 詳細な業績登録方法
- `scripts/create_publication.sh`: 業績テンプレート生成スクリプト
- 既存業績例: `content/publication/20240531-jsai-atsushi-omata/`
- プロジェクト一覧: `content/project/` ディレクトリ
- 著者一覧: `content/authors/` ディレクトリ

## 注意事項

- 既存のフォルダ構成や設定は変更しないこと
- 必ず日本語版と英語版の両方を作成すること
- 著者名は `content/authors/` のフォルダ名と正確に一致させること
- プロジェクト名は `content/project/` のフォルダ名と正確に一致させること
- コミット前にローカル環境で動作確認を行うこと
- 既存業績のフォーマットを参考にして一貫性を保つこと
- YAML構文エラーに注意（インデント、引用符の使用など）