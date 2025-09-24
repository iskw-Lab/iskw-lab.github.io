# BibTeX業績インポートプロンプト

このプロンプトは、BibTeX形式で提供された業績情報を研究室Webサイトのフォーマットに変換し、既存の業績リストに追加するための自動化支援ツールです。BibTeXエントリを解析して、適切なディレクトリ構造とMarkdownファイルを生成します。

## 前提条件

- BibTeX形式のエントリが提供されることを想定しています
- 既存の `content/publication/` ディレクトリ構造を理解していること
- 著者名とプロジェクトの対応関係を把握していること

## 処理手順

### 1. BibTeXエントリの解析

提供されたBibTeXエントリから以下の情報を抽出してください：

#### 基本情報
- **論文タイトル**: `title` フィールド
- **著者リスト**: `author` フィールド（複数著者は " and " で区切られている）
- **発表年**: `year` フィールド
- **DOI**: `doi` フィールド（存在する場合）

#### 出版情報
- **@inproceedings**: 会議発表論文
  - `booktitle`: 会議名
  - `organization`: 主催組織
- **@article**: 雑誌論文
  - `journal`: 雑誌名
  - `volume`, `number`, `pages`: 巻号ページ情報
- **@thesis**: 学位論文
  - `school`: 学位授与機関

### 2. 著者名のマッピング

BibTeXの著者名を研究室メンバーのユーザー名にマッピングしてください：

#### 研究室メンバー（content/authors/ のフォルダ名と対応）
- 石川 翔吾 → `admin`
- 小俣敦士 → `atsushi-omata`
- 榎本 優香 → `yuka-enomoto`
- 広部 惠太 → `keita-hirobe`
- 大原 理沙 → `risa-ohara`
- その他のメンバーは適宜確認

#### 外部著者の処理
- 研究室メンバー以外は姓名をスペース区切りで記載
- 例: "増川 ねてる", "中野目 あゆみ", "香山 壮太"

### 3. 出版タイプとカテゴリの判定

#### publication_types の設定
```yaml
# BibTeX entry type に基づく判定
@inproceedings → paper-conference
@article → article-journal (雑誌の場合) または paper-conference (学会研究会資料の場合)
@thesis → thesis
```

#### categories の設定
```yaml
# 会議名や雑誌名から判定
- 人工知能学会全国大会 → Domestic Conference
- 情報処理学会 → Domestic Conference  
- 国際会議 → International Conference
- 学術雑誌論文 → Journal Paper
- ポスター発表 → Poster Presentation
```

### 4. ディレクトリ名の生成

BibTeX情報から適切なディレクトリ名を生成：

```
形式: YYYYMMDD-[会議略称]-[第一著者名]
```

#### 会議略称の例
- 人工知能学会全国大会 → jsai
- 情報処理学会論文誌 → ipsj
- 高齢社会デザイン研究会 → asd
- VR学会 → vrsj
- JAMI → jami

#### 日付の推定
- `year` フィールドから年を取得
- 会議の場合は一般的な開催月を推定（例：人工知能学会全国大会は5月）
- 不明な場合は `01` を使用

### 5. プロジェクトの推定

論文のタイトルやキーワードから関連プロジェクトを推定：

#### プロジェクト一覧（content/project/ のフォルダ名）
- `care-dx`: 認知症ケア、DX関連
- `care-interaction`: ケアインタラクション関連
- `llm-self-care`: LLM、チャットボット、概念学習関連
- `vr-nursing-education`: VR、看護教育関連
- `english-learning-support`: 英語学習支援関連
- `metaverse-px`: メタバース、患者体験関連

### 6. ファイル生成

#### ディレクトリとファイルの作成
1. `content/publication/[directory-name]/` ディレクトリを作成
2. `index.ja.md` （日本語版）を作成
3. `index.en.md` （英語版）を作成  
4. `cite.bib` （元のBibTeXエントリ）を作成

#### index.ja.md テンプレート
```yaml
---
title: "[BibTeXのtitleをそのまま使用]"
authors:
  - [第一著者のユーザー名]
  - [共著者名またはユーザー名]
  - admin  # 石川先生が著者の場合

date: '[推定した日付]T00:00:00+09:00'
publishDate: '[推定した日付]T00:00:00+09:00'

doi: '[DOIがある場合]'

publication_types: 
  - [判定した出版タイプ]

categories:
  - [判定したカテゴリ]

publication: In *[booktitle または journal名]*
publication_short: In *[略称]*

abstract: "[概要は空文字列または推定]"

summary: [会議名]にて発表しました。

projects:
  - [推定したプロジェクト名]

tags:
  - [タイトルから抽出したキーワード]

featured: false

links:
- name: [会議名または雑誌名]
  url: ""

image:
  caption: ""
  focal_point: ""
  preview_only: false

url_pdf: ""
url_slides: ""
url_video: ""
url_code: ""
url_dataset: ""
url_project: ""
---
```

#### index.en.md テンプレート
```yaml
---
title: "[英語タイトル - 日本語の場合は要翻訳]"
authors:
  - [日本語版と同一]

date: '[日本語版と同一]'
publishDate: '[日本語版と同一]'

doi: '[日本語版と同一]'

publication_types: 
  - [日本語版と同一]

categories:
  - [日本語版と同一]

publication: In *[英語での会議名/雑誌名]*
publication_short: In *[英語での略称]*

abstract: "[英語概要 - 日本語の場合は要翻訳]"

summary: We presented at [Conference Name].

projects:
  - [日本語版と同一]

tags:
  - [日本語版と同一 - 必要に応じて英語化]

featured: false

links:
- name: [英語での会議名/雑誌名]
  url: ""

image:
  caption: ""
  focal_point: ""
  preview_only: false

url_pdf: ""
url_slides: ""
url_video: ""
url_code: ""
url_dataset: ""
url_project: ""
---
```

### 7. 処理例

#### 入力BibTeX例
```bibtex
@inproceedings{小俣24,
  author       = {小俣敦士 and 榎本 優香 and 増川 ねてる and 石川 翔吾},
  booktitle    = {2024年度人工知能学会全国大会（第38回）},
  organization = {一般社団法人 人工知能学会},
  title        = {ナレッジグラフと LLM の連携による概念獲得支援チャットボットの開発},
  year         = {2024}
}
```

#### 処理結果
1. **ディレクトリ名**: `20240531-jsai-atsushi-omata`
2. **著者マッピング**: 
   - 小俣敦士 → atsushi-omata
   - 榎本 優香 → yuka-enomoto  
   - 増川 ねてる → "増川 ねてる" （外部著者）
   - 石川 翔吾 → admin
3. **出版情報**:
   - publication_types: paper-conference
   - categories: Domestic Conference
4. **プロジェクト推定**: llm-self-care（LLM、チャットボット関連）
5. **タグ**: LLM, ナレッジグラフ, チャットボット

### 8. 実装チェックリスト

BibTeX取り込み処理では以下を確認してください：

- [ ] BibTeXエントリの構文解析が正しく行われている
- [ ] 著者名が適切に研究室メンバーにマッピングされている
- [ ] 石川先生が `admin` として正しく設定されている
- [ ] 出版タイプとカテゴリが適切に判定されている
- [ ] ディレクトリ名が既存のルールに従っている
- [ ] 日本語版と英語版の両方が作成されている
- [ ] プロジェクトが適切に推定・設定されている
- [ ] BibTeXファイル（cite.bib）が正しく保存されている
- [ ] YAML構文エラーがないことを確認
- [ ] 必須フィールドがすべて設定されている

## 注意事項とベストプラクティス

### 必須の確認事項
- 既存のフォルダ構成や設定は変更しないこと
- 著者名は `content/authors/` のフォルダ名と正確に一致させること
- プロジェクト名は `content/project/` のフォルダ名と正確に一致させること
- 日本語版と英語版の整合性を保つこと

### 推奨される処理方針
- 不明な情報は空文字列で設定し、後で手動編集できるようにする
- 自動推定できない情報（URL、概要など）は明示的にコメントを残す
- 既存の同種業績を参考にして一貫性を保つ
- 疑わしい判定は保守的に行い、確認を促すコメントを残す

### エラー処理
- BibTeX構文エラーの場合は詳細なエラーメッセージを表示
- 未知の著者名の場合は外部著者として処理し、確認を促す
- 重複するディレクトリ名の場合は連番を付加して回避

## 参考資料

- `content/publication/README_publication.md`: 詳細な業績登録方法
- `.ai/prompts/add_publication.md`: 手動業績追加プロンプト
- 既存業績例: `content/publication/` 配下の各ディレクトリ
- プロジェクト一覧: `content/project/` ディレクトリ
- 著者一覧: `content/authors/` ディレクトリ