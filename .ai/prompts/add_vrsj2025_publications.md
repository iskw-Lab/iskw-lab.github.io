# VRSJ 2025業績追加作業プロンプト

このドキュメントは、第30回日本バーチャルリアリティ学会大会（VRSJ 2025）の業績を追加した際の作業手順を記録したものです。

## 作業概要

2件のVRSJ 2025発表論文を研究室Webサイトに追加する作業を実施しました。

## 入力情報

### 業績1: 廣部 敬太（第一著者）
- **タイトル**: 認知症当事者との共同創造における生成AIを活用した幻覚モデリング手法
- **著者**: 〇廣部 敬太(静岡大学)、小俣 敦士(静岡大学、浜松医科大学)、水野 拓宏(株式会社アルファコード)、村上 祐順(一般財団法人オレンジクロス)、石川 翔吾(静岡大学)
- **出版情報**: 第30回日本バーチャルリアリティ学会大会 (VRSJ 2025)
- **概要**: 認知症の症状は後天的な脳機能の障害によって生じるため，個別性が高く多様である．本研究では，幻覚をはじめとした認知症症状を体験可能な患者体験（PX）空間を構築し，当事者との共同創造を行なった．従来の共同創造プロセスでは，当事者の主観的体験を実装するまでのイテレーションが長くなる課題があった．そこで本研究では，生成AIを活用した3Dモデル生成と挙動設計の半自動化による効率的な幻覚モデリング手法を提案する．
- **PDF URL**: https://conference.vrsj.org/ac2025/program/doc/1B2-07.pdf
- **会議URL**: https://conference.vrsj.org/ac2025/index.html

### 業績2: 安川 陽大（第一著者）
- **タイトル**: 認知症ケア実践知高度化のためのVRシミュレーション教育の初期検討
- **著者**: 〇安川 陽大(静岡大学)、廣部 敬太(静岡大学)、小俣 敦士(静岡大学、浜松医科大学)、水野 拓宏(株式会社アルファコード)、村上 祐順(一般財団法人オレンジクロス)、石川 翔吾(静岡大学)
- **出版情報**: 第30回日本バーチャルリアリティ学会大会 (VRSJ 2025)
- **概要**: ケア現場では，支援対象者の状態やコンテキストに応じた個別性の高い実践が求められる．本研究では，VR空間のアバターと実践的なケアリングをトレーニングするためのVRシミュレーション教育を構築する．実践的なトレーニングを経験するために，非日常的な誘導的要素を排除し，学習者が批判的な思考を働かせることが可能な環境を提案する．
- **PDF URL**: https://conference.vrsj.org/ac2025/program/doc/1B2-09.pdf
- **会議URL**: https://conference.vrsj.org/ac2025/index.html

## 作業手順

### 1. 既存業績の確認

まず、リポジトリ内の既存業績を確認し、同じ学会の業績が既に登録されているかをチェックしました。

```bash
cd /home/runner/work/iskw-lab.github.io/iskw-lab.github.io
find content/publication -type f -name "index.ja.md" | grep vrsj
```

**結果**: 
- `content/publication/20250917-vrsj-keita-hirobe/` が既に存在
- このディレクトリの業績が業績1（廣部 敬太の論文、PDF: 1B2-07.pdf）と一致することを確認

### 2. 著者情報の確認

新しい業績の著者（安川 陽大）のプロファイルがリポジトリに存在するかを確認しました。

```bash
ls -la content/authors/ | grep yasukawa
```

**結果**:
- `hinata-yasukawa` ディレクトリが存在
- 著者識別子として `hinata-yasukawa` を使用

### 3. 参照テンプレートの選定

既存の同一学会発表（`20250917-vrsj-keita-hirobe`）をテンプレートとして参照しました。これにより以下の情報を確認：
- ディレクトリ命名規則: `YYYYMMDD-vrsj-[第一著者名]`
- 日付: `2025-09-17`（学会発表日）
- 会議情報、カテゴリ、プロジェクト設定

### 4. 新規業績ディレクトリの作成

業績2（安川 陽大の論文）用のディレクトリを作成しました。

```bash
mkdir -p content/publication/20250917-vrsj-hinata-yasukawa
```

**ディレクトリ命名規則**:
- 形式: `YYYYMMDD-[会議略称]-[第一著者識別子]`
- 実例: `20250917-vrsj-hinata-yasukawa`

### 5. 日本語版ファイルの作成

`content/publication/20250917-vrsj-hinata-yasukawa/index.ja.md` を作成しました。

**重要な設定ポイント**:

#### 著者リスト
```yaml
authors:
  - hinata-yasukawa  # 第一著者（著者プロファイルの識別子）
  - keita-hirobe     # 第二著者
  - atsushi-omata    # 第三著者
  - 水野 拓宏        # 外部著者（姓名をスペース区切り）
  - 村上 祐順        # 外部著者
  - admin           # 石川先生（常にadmin）
```

#### 出版情報
```yaml
publication_types:
  - paper-conference

categories:
  - Domestic Conference

publication: In *第30回日本バーチャルリアリティ学会大会*
publication_short: In *VRSJ 2025*
```

#### 関連情報
```yaml
projects:
  - metaverse-px  # 関連プロジェクト

tags:
  - VR
  - Care Training
  - Simulation Education
  - Dementia Care

url_pdf: "https://conference.vrsj.org/ac2025/program/doc/1B2-09.pdf"

links:
- name: 第30回日本バーチャルリアリティ学会大会
  url: https://conference.vrsj.org/ac2025/index.html
```

### 6. 英語版ファイルの作成

`content/publication/20250917-vrsj-hinata-yasukawa/index.en.md` を作成しました。

**重要なポイント**:
- **著者リスト**: 日本語版と完全に同一の識別子を使用
- **日時情報**: 日本語版と同一
- **タイトル**: 英訳（"Initial Examination of VR Simulation Education for Advancing Dementia Care Practical Knowledge"）
- **概要**: 英訳
- **会議名**: 英語表記（"The 30th Annual Conference of the Virtual Reality Society of Japan"）
- **その他URL、プロジェクト、タグ**: 日本語版と同一

### 7. 動作確認

本来はHugoでのビルド確認を行うべきですが、環境にHugoがインストールされていなかったため、以下を確認：
- ファイル構造が既存業績と一致していること
- YAML構文エラーがないこと
- 著者識別子が `content/authors/` のディレクトリと一致していること

```bash
ls -la content/publication/20250917-vrsj-hinata-yasukawa/
# 結果: index.ja.md と index.en.md が存在することを確認
```

### 8. コミットとプッシュ

`report_progress` ツールを使用して変更をコミット・プッシュしました。

```bash
# report_progressツールが自動実行:
# - git add .
# - git commit -m "Add VRSJ 2025 publication for Hinata Yasukawa"
# - git push
```

## 学んだポイントと注意事項

### 1. 既存業績の重複確認が重要
- 同じ学会・同じ著者の業績が既に登録されている可能性があるため、必ず最初に確認する
- 今回は業績1が既に登録済みだったため、業績2のみを追加

### 2. 著者識別子の確認方法
- `content/authors/` ディレクトリのフォルダ名が著者識別子
- フォルダ内の `_index.ja.md` で著者情報を確認
- 例: `hinata-yasukawa` フォルダ → 著者: 安川 陽大

### 3. 外部著者の扱い
- 研究室メンバー: 著者識別子を使用（例: `keita-hirobe`）
- 外部著者: 姓名をスペース区切りで記載（例: `水野 拓宏`）
- 石川先生: 常に `admin`

### 4. ディレクトリ命名規則
- 形式: `YYYYMMDD-[会議略称]-[第一著者識別子]`
- 日付は発表日または出版日
- 会議略称は小文字で統一（例: `vrsj`, `jsai`, `asd`）
- 第一著者識別子は `content/authors/` のフォルダ名と一致

### 5. 日本語版と英語版の整合性
以下の項目は両バージョンで同一である必要があります：
- `authors` リスト
- `date` と `publishDate`
- `doi`
- `publication_types`
- `categories`
- `projects`
- `tags`
- 各種URL（`url_pdf`, `url_code` など）

### 6. プロジェクト名の確認
- `projects` フィールドには `content/project/` のフォルダ名を指定
- 今回は `metaverse-px` プロジェクトに紐付け
- 不明な場合は既存の類似業績を参照

### 7. タグの選定
- 論文の内容を表すキーワードを選定
- 英語で記載（日本語・英語版で共通）
- 既存業績のタグを参考に一貫性を保つ

## ファイル構造

```
content/publication/20250917-vrsj-hinata-yasukawa/
├── index.ja.md  # 日本語版業績情報
└── index.en.md  # 英語版業績情報
```

## 参考資料

- `.ai/prompts/add_publication.md`: 業績追加の一般的な手順
- `content/publication/README_publication.md`: 詳細な業績登録方法
- `content/publication/20250917-vrsj-keita-hirobe/`: テンプレートとして参照した既存業績
- `content/authors/`: 著者プロファイル一覧
- `content/project/`: プロジェクト一覧

## まとめ

今回の作業では、以下の手順で2件のVRSJ 2025業績を管理しました：

1. ✅ 既存業績の確認 → 業績1は既に登録済みと判明
2. ✅ 著者情報の確認 → `hinata-yasukawa` を使用
3. ✅ テンプレート選定 → 同一学会の既存業績を参照
4. ✅ 新規ディレクトリ作成 → `20250917-vrsj-hinata-yasukawa`
5. ✅ 日本語版作成 → `index.ja.md`
6. ✅ 英語版作成 → `index.en.md`
7. ✅ 構造確認 → ファイル・YAML構文確認
8. ✅ コミット・プッシュ → `report_progress` 使用

この手順により、既存業績との一貫性を保ちながら、効率的に新しい業績を追加することができました。
