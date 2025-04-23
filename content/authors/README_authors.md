---
draft: true
---

# 著者プロファイルのドキュメント

著者プロファイルの作成と管理方法について説明します。各著者は`content/authors/`ディレクトリの下に、日本語（`_index.ja.md`）と英語（`_index.en.md`）の両方のプロファイルファイルを持つ独自のディレクトリを作成する必要があります。

## 必須項目と任意項目

プロファイルファイルには以下の項目が含まれます：

### 必須項目
- 基本情報（`title`, `authors`, `role`）
- 所属組織（`organizations`）
- ユーザーグループ（`user_groups`）

### 任意項目
- 研究関心分野（`interests`）
- 学歴（`education`）
- ソーシャルリンク（`social`）
- メールとGravatar（`email`, `highlight_name`）
- About Meセクション

## ディレクトリ構造

```
content/authors/
├── author-name/           # ディレクトリ名は著者のユーザー名と一致させる
│   ├── _index.ja.md      # 日本語プロファイル
│   ├── _index.en.md      # 英語プロファイル
│   └── avatar.png        # プロフィール写真
└── README_authors.md     # このドキュメント
```

## プロファイルファイルの構造

日本語と英語のプロファイルファイルは、メタデータにYAML front matterを使用し、コンテンツにMarkdownを使用する同じ構造に従います。各フィールドの詳細な説明は以下の通りです：

### Front Matter フィールド

1. **基本情報**（必須）
   - `title`: 表示名（例：「小俣 敦士」や「Atsushi Omata」）
   - `authors`: ユーザー名（ディレクトリ名と一致させる必要があります）
   - `role`: 現在の役職/役割（例：「学術研究員」や「Research Associate」）
   - `superuser`: サイトの主要管理者の場合は`true`、それ以外は`false`に設定
   - `weight`: リストでの表示順序（数字が小さいほど先に表示）
     - 学生メンバーの場合は以下の規則に従って設定：
       - 博士課程：1年（7）、2年（8）、3年（9）、バッファー（10）
       - 修士課程：1年（4）、2年（5）、バッファー（6）
       - 学部生：3年（1）、4年（2）、バッファー（3）
     - 例：学士4年生の場合は`weight: 2`

2. **所属組織**（必須）
   ```yaml
   organizations:
     - name: 組織名
       url: 'https://example.com'
   ```
   - 現在の所属を名前とURLでリスト化
   - 複数の組織を含めることが可能

3. **研究関心分野**（任意）
   ```yaml
   interests:
     - 関心分野1
     - 関心分野2
   ```
   - 研究関心分野をリスト化

4. **学歴**（任意）
   ```yaml
   education:
     courses:
       - course: 学位名
         institution: 大学名
         year: 卒業年
   ```
   - 学歴を時系列順にリスト化
   - 学位、機関、年を含める

5. **ソーシャルリンク**（任意）
   ```yaml
   social:
     - icon: アイコン名
       icon_pack: パック名
       link: URL
   ```
   - 利用可能なアイコン: envelope, twitter, github, graduation-cap, link など
   - アイコンパック: fas (Font Awesome Solid), fab (Font Awesome Brands)
   - 関連する学術的・専門的なリンクを含める

6. **メールとGravatar**（任意）
   - `email`: Gravatar用のメールアドレス
   - `highlight_name`: リストで著者を強調表示する場合は`true`に設定

7. **ユーザーグループ**（必須）
   ```yaml
   user_groups:
     - Faculty
     - Staff
     - Members
   ```
   - 研究グループ内での著者の役割を分類
   - 利用可能なグループ: Faculty, Staff, Members, Researchers など
   - 他の著者の情報を参考にしてください

### コンテンツセクション

front matterの後（`---`の後）に、Markdown形式で詳細な「About Me」セクションを追加できます。このセクションには以下を含めるべきです：
- 包括的な自己紹介
- 現在の研究焦点
- 専門的背景
- その他の関連情報

## プロファイルの更新方法

1. 新規メンバーのための新しいディレクトリを作成
2. 既存のプロファイルをテンプレートとしてコピー
3. 関連する情報をすべて更新
4. 日本語版と英語版の両方を追加
5. コミット前にローカルで変更をテスト

## トラブルシューティング

- YAML構文が正しいことを確認（適切なインデント、タブなし）
- 必須フィールドがすべて記入されていることを確認
- リンクが機能することを確認
- 両方の言語バージョンが一貫していることを確認 