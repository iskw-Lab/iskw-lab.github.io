# 個別メンバーステータス変更プロンプト

このプロンプトは、研究室Webサイトの特定メンバーのステータスを変更するためのツールです。主に卒業生への変更や学年進級に使用します。

## 使用方法

### 基本的な使い方

**入力例**:
```
[username]を卒業生にしてください
```

または

```
content/authors/[username] を卒業生にして
```

## 処理手順

### ステップ1: 対象メンバーの確認

まず、対象メンバーの現在の情報を確認します：

```bash
# 対象メンバーの現在のステータスを確認
username="[username]"
echo "=== Japanese ==="
grep -E "^(role:|weight:|user_groups:)" content/authors/$username/_index.ja.md
echo ""
echo "=== English ==="
grep -E "^(role:|weight:|user_groups:)" content/authors/$username/_index.en.md
```

### ステップ2: ステータスの変更

#### 卒業生への変更の場合

現在の学年に応じて、適切な卒業年と学位を設定します。

**学士（B4）から卒業生への変更**

日本語版 (`_index.ja.md`):
```yaml
# 変更前
role: 学士（B4）
weight: 2
user_groups:
  - 学部生
  - メンバー
  - 学生

# 変更後
role: [卒業年]年卒業生（学士）
# weight: 削除
user_groups:
  - 卒業生
```

英語版 (`_index.en.md`):
```yaml
# 変更前
role: Bachelor's Student (B4)
weight: 2
user_groups:
  - Undergraduate Students
  - Members
  - Students

# 変更後
role: Graduates in [Year] (Bachelor's Degree)
# weight: 削除
user_groups:
  - Alumni
```

**修士（M2）から卒業生への変更**

日本語版 (`_index.ja.md`):
```yaml
# 変更前
role: 修士（M2）
weight: 5
user_groups:
  - 修士課程
  - メンバー
  - 学生

# 変更後
role: [卒業年]年卒業生（修士）
# weight: 削除
user_groups:
  - 卒業生
```

英語版 (`_index.en.md`):
```yaml
# 変更前
role: Master's Student (M2)
weight: 5
user_groups:
  - Master's Students
  - Members
  - Students

# 変更後
role: Graduates in [Year] (Master's Degree)
# weight: 削除
user_groups:
  - Alumni
```

**博士（D3）から卒業生への変更**

日本語版 (`_index.ja.md`):
```yaml
# 変更前
role: 博士（D3）
weight: 9
user_groups:
  - 博士課程
  - メンバー
  - 学生

# 変更後
role: [卒業年]年卒業生（博士）
# weight: 削除
user_groups:
  - 卒業生
```

英語版 (`_index.en.md`):
```yaml
# 変更前
role: Doctoral Student (D3)
weight: 9
user_groups:
  - Doctoral Students
  - Members
  - Students

# 変更後
role: Graduates in [Year] (Doctoral Degree)
# weight: 削除
user_groups:
  - Alumni
```

#### 学年進級の場合

学年進級の詳細については、`annual_member_update.md` の「ステップ2: 学年進級処理」を参照してください。

### ステップ3: 動作確認

変更後は以下で確認を行ってください：

```bash
# YAML構文チェック（Pythonを使用）
python3 << 'EOF'
import yaml

username = "[username]"
files = [
    f'content/authors/{username}/_index.ja.md',
    f'content/authors/{username}/_index.en.md'
]

for file in files:
    with open(file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    parts = content.split('---')
    if len(parts) >= 3:
        yaml_content = parts[1]
        try:
            data = yaml.safe_load(yaml_content)
            print(f'✓ {file}: Valid YAML')
            print(f'  Role: {data.get("role")}')
            print(f'  User groups: {data.get("user_groups")}')
            print(f'  Weight: {data.get("weight", "(not set)")}')
        except yaml.YAMLError as e:
            print(f'✗ {file}: YAML Error - {e}')
EOF
```

```bash
# 変更内容の確認
git --no-pager diff content/authors/[username]/
```

## 重要な注意事項

### 1. 対象メンバーの特定
- usernameは `content/authors/` ディレクトリ内のフォルダ名と一致させる
- 必ず日本語版と英語版の両方を更新する
- 他のメンバーのステータスは変更しない

### 2. 卒業年の決定
- 通常、変更を行う年を卒業年として設定
- 例：2025年に卒業処理を行う場合 → 「2025年卒業生」「Graduates in 2025」

### 3. ファイル操作の注意点
- `authors` フィールドのusernameは変更しない
- プロファイル画像（`avatar.png`/`avatar.jpg`）はそのまま維持
- コメント行（`# D: 10, 9, 8, 7` など）は保持

### 4. Weight値について
- 卒業生になる場合は必ず削除
- 現役メンバーの場合は学年に応じた適切な値を設定（詳細は `annual_member_update.md` 参照）

## 参考情報

### 現在の学年とWeight値の対応

```
学生系:
- D3: 9
- D2: 8
- D1: 7
- M2: 5
- M1: 4
- B4: 2
- B3: 1
```

### User Groups 対応表

| 日本語 | 英語 | 対象 |
|--------|------|------|
| 学部生 | Undergraduate Students | B3, B4 |
| 修士課程 | Master's Students | M1, M2 |
| 博士課程 | Doctoral Students | D1, D2, D3 |
| メンバー | Members | 現役全員 |
| 学生 | Students | 現役学生全員 |
| 卒業生 | Alumni | 卒業生・修了生 |

### 関連プロンプト

- **一括更新**: `annual_member_update.md` - 年度始めの全メンバー一括更新用
- **新メンバー追加**: `add_new_member.md` - 新しいメンバーを追加する際に使用

## 実行例

### 例1: 学士学生を卒業生にする

```
bryant-suryonoを卒業生にしてください
```

処理内容:
1. `content/authors/bryant-suryono/_index.ja.md` と `_index.en.md` を確認
2. 現在の学年（B4）を確認
3. 日本語版: role を「2025年卒業生（学士）」に変更、weight削除、user_groupsを「卒業生」に変更
4. 英語版: role を「Graduates in 2025 (Bachelor's Degree)」に変更、weight削除、user_groupsを「Alumni」に変更
5. YAML構文チェック
6. 変更内容の確認

### 例2: 複数メンバーを卒業生にする

```
以下のメンバーを卒業生にしてください：
- taro-yamada (学士)
- hanako-sato (修士)
```

各メンバーについて上記の処理を実行します。

このプロンプトにより、個別メンバーのステータス変更を安全かつ効率的に実行できます。
