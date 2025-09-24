# 新メンバー追加プロンプト

このプロンプトは、研究室Webサイトに新しいメンバーを追加するための自動化支援ツールです。新入生の情報をリスト形式で受け取り、既存のメンバーリストに適切に追加・更新することができます。

## 前提条件

- 新入生の情報は以下の形式でリスト提供されることを想定しています：
  ```
  - 名前: [日本語名] / [英語名]
  - 学年: [B3/B4/M1/M2/D1/D2/D3など]
  - その他の情報: [任意]
  ```

## 処理手順

### 1. 既存構造の確認

まず、以下のディレクトリ構造を確認してください：
```
content/authors/
├── [username]/
│   ├── _index.ja.md      # 日本語プロファイル
│   ├── _index.en.md      # 英語プロファイル
│   └── avatar.png        # プロフィール写真（任意）
└── README_authors.md     # ドキュメント
```

### 2. ユーザー名の生成

新メンバーのユーザー名は以下のルールで生成してください：
- 形式: `[名前]-[姓]` （全て小文字、ハイフン区切り）
- 例: 「田中太郎」→ `taro-tanaka`、「佐藤花子」→ `hanako-sato`

### 3. ディレクトリとファイルの作成

各新メンバーに対して以下を実行：

1. `content/authors/[username]/` ディレクトリを作成
2. 既存メンバーのプロファイルをテンプレートとしてコピー（推奨: `yuna-kawashima` または `sakura-yui`）
3. 日本語版（`_index.ja.md`）と英語版（`_index.en.md`）を作成

### 4. プロファイル情報の更新

#### 必須フィールド

**日本語版 (`_index.ja.md`)**:
```yaml
---
# Display name
title: [日本語フルネーム]

# Username (this should match the folder name)
authors:
  - [username]

# Is this the primary user of the site?
superuser: false

# Role/position
role: [学士（B3）/学士（B4）/修士（M1）/修士（M2）/博士（D1）など]

# Weight for member ordering
# D: 10, 9, 8, 7 (D1=7, D2=8, D3=9, buffer=10)
# M: 6, 5, 4 (M1=4, M2=5, buffer=6)  
# B: 3, 2, 1 (B3=1, B4=2, buffer=3)
weight: [適切な数値]

# Organizations/Affiliations
organizations:
  - name: 静岡大学
    url: ''

# Short bio
bio: ''

interests: []

# Social/Academic Networking
social: []

# Email for Gravatar
email: ''

# Highlight?
highlight_name: false

# User groups
user_groups:
  - [学部生/修士課程/博士課程]
  - メンバー
  - 学生
---
```

**英語版 (`_index.en.md`)**:
```yaml
---
# Display name
title: [English Full Name]

# Username (this should match the folder name)
authors:
  - [username]

# Is this the primary user of the site?
superuser: false

# Role/position
role: [Bachelor's Student (B3)/Master's Student (M1)/など]

# Weight (same as Japanese version)
weight: [同じ数値]

# Organizations/Affiliations
organizations:
  - name: Shizuoka University
    url: ''

# Short bio
bio: ''

interests: []

# Social/Academic Networking
social: []

# Email for Gravatar
email: ''

# Highlight?
highlight_name: false

# User groups
user_groups:
  - [Undergraduate Students/Master's Students/Doctoral Students]
  - Members
  - Students
---
```

#### 重要な設定ルール

1. **Weight値の設定**:
   - B3 (学士3年): `weight: 1`
   - B4 (学士4年): `weight: 2`
   - M1 (修士1年): `weight: 4`
   - M2 (修士2年): `weight: 5`
   - D1 (博士1年): `weight: 7`
   - D2 (博士2年): `weight: 8`
   - D3 (博士3年): `weight: 9`

2. **User Groups**:
   - 学部生: `[学部生, メンバー, 学生]` / `[Undergraduate Students, Members, Students]`
   - 修士: `[修士課程, メンバー, 学生]` / `[Master's Students, Members, Students]`
   - 博士: `[博士課程, メンバー, 学生]` / `[Doctoral Students, Members, Students]`

3. **Role表記**:
   - 日本語: `学士（B3）`, `修士（M1）`, `博士（D1）`など
   - 英語: `Bachelor's Student (B3)`, `Master's Student(M1)`, `Doctoral Student(D1)`など
   - 注意: 英語版では括弧の前にスペースを含めない場合もある（既存例を参考に）

### 5. アバター画像の処理

- 新しいアバター画像が提供されていない場合は、既存メンバーから適切な画像をコピー
- ファイル名は `avatar.png` で統一
- 推奨コピー元: 同性・同学年のメンバーから選択

### 6. 動作確認

1. Hugo開発サーバーで確認:
   ```bash
   hugo server -D
   ```
2. ブラウザで `http://localhost:1313` にアクセス
3. Membersセクションで新しいメンバーが正しく表示されることを確認

### 7. 実装例

**入力例**:
```
新入生リスト:
- 名前: 山田太郎 / Taro Yamada
- 学年: B3
- 名前: 鈴木花子 / Hanako Suzuki  
- 学年: M1
```

**処理結果**:
1. `content/authors/taro-yamada/` ディレクトリ作成
   - `_index.ja.md` (weight: 1, role: 学士（B3）)
   - `_index.en.md` (weight: 1, role: Bachelor's Student (B3))
   - `avatar.png` (既存から複製)

2. `content/authors/hanako-suzuki/` ディレクトリ作成
   - `_index.ja.md` (weight: 4, role: 修士（M1）)
   - `_index.en.md` (weight: 4, role: Master's Student (M1))
   - `avatar.png` (既存から複製)

## 参考資料

- Issue #11: 新3年生のメンバー追加
- PR #14: Add 3 B3 members to content/authors directory
- PR #16: fix authors-b3.weight 3->1
- `content/authors/README_authors.md`: 詳細なドキュメント

## 注意事項

- 既存のフォルダ構成や設定は変更しないこと
- 必ず日本語版と英語版の両方を作成すること
- Weight値は学年に応じて正確に設定すること
- コミット前にローカル環境で動作確認を行うこと
- 既存メンバーのプロファイルを参考にして一貫性を保つこと