# メンバーステータス更新プロンプト

このプロンプトは、研究室Webサイトのメンバー情報を自動的に更新するためのツールです。学年の進級（grade promotion）と卒業生のアルムナイタグ付与を効率的に行うことができます。

## 前提条件

- 現在のメンバー情報は `content/authors/` ディレクトリに保存されています
- 各メンバーには日本語版（`_index.ja.md`）と英語版（`_index.en.md`）のプロファイルがあります
- 現役メンバーと卒業生は `user_groups` で区別されています

## 使用方法

### 1. 基本使用：全メンバーの学年アップデート

**入力例**:
```
全メンバーの学年を新学期に向けてアップデートしてください
```

この場合、以下の進級が自動実行されます：
- B3 → B4
- B4 → M1（進学者の場合）
- M1 → M2
- M2 → D1（進学者の場合）
- D1 → D2
- D2 → D3

### 2. 卒業生指定：特定メンバーの卒業処理

**入力例**:
```
以下のメンバーを卒業生として処理してください：
- 山田太郎 (taro-yamada) - 学士卒業
- 佐藤花子 (haneko-sato) - 修士卒業
- 田中次郎 (jiro-tanaka) - 博士卒業
```

## 処理手順

### ステップ1: 既存メンバーの状況確認

まず、以下のコマンドで現在のメンバー状況を確認してください：

```bash
# 現役メンバーの学年と重み値を確認
for file in content/authors/*/_index.ja.md; do 
    username=$(basename $(dirname $file))
    role=$(grep "^role:" $file | head -1)
    weight=$(grep "^weight:" $file | head -1)
    groups=$(grep -A5 "user_groups:" $file | grep -v "user_groups:" | grep -v "---")
    if ! grep -q "卒業生" $file; then
        echo "$username: $role | $weight"
    fi
done | sort
```

### ステップ2: 学年進級処理

#### 進級ルール
1. **Weight値の更新**:
   - B3 (weight: 1) → B4 (weight: 2)
   - B4 (weight: 2) → M1 (weight: 4) ※進学者のみ
   - M1 (weight: 4) → M2 (weight: 5)
   - M2 (weight: 5) → D1 (weight: 7) ※進学者のみ
   - D1 (weight: 7) → D2 (weight: 8)
   - D2 (weight: 8) → D3 (weight: 9)

2. **Role表記の更新**:
   - 日本語版: `学士（B3）` → `学士（B4）`, `修士（M1）` → `修士（M2）`等
   - 英語版: `Bachelor's Student (B3)` → `Bachelor's Student (B4)`, `Master's Student (M1)` → `Master's Student (M2)`等

3. **User Groups の調整**:
   - 学部から修士への進学: `[学部生, メンバー, 学生]` → `[修士課程, メンバー, 学生]`
   - 修士から博士への進学: `[修士課程, メンバー, 学生]` → `[博士課程, メンバー, 学生]`

#### 実装例（B3からB4への進級）

**日本語版更新**:
```yaml
# 変更前
role: 学士（B3）
weight: 1
user_groups:
  - 学部生
  - メンバー
  - 学生

# 変更後  
role: 学士（B4）
weight: 2
user_groups:
  - 学部生
  - メンバー
  - 学生
```

**英語版更新**:
```yaml
# 変更前
role: Bachelor's Student (B3)
weight: 1
user_groups:
  - Undergraduate Students
  - Members
  - Students

# 変更後
role: Bachelor's Student (B4)
weight: 2
user_groups:
  - Undergraduate Students
  - Members
  - Students
```

### ステップ3: 卒業生処理

#### 卒業生への変更ルール

1. **Role の更新**:
   - 日本語版: `[卒業年]年卒業生（学士/修士/博士）`
   - 英語版: `Graduates in [年] (Bachelor's/Master's/Doctoral Degree)`

2. **User Groups の変更**:
   - 日本語版: `[卒業生]` のみ
   - 英語版: `[Alumni]` のみ

3. **Weight の削除**:
   - 卒業生はweight値を持たない（表示順序は卒業年などで決定）

#### 実装例（学士卒業生への変更）

**日本語版更新**:
```yaml
# 変更前
role: 学士（B4）
weight: 2
user_groups:
  - 学部生
  - メンバー
  - 学生

# 変更後
role: 2024年卒業生（学士）
# weight: 削除
user_groups:
  - 卒業生
```

**英語版更新**:
```yaml
# 変更前
role: Bachelor's Student (B4)
weight: 2
user_groups:
  - Undergraduate Students
  - Members
  - Students

# 変更後
role: Graduates in 2024 (Bachelor's Degree)
# weight: 削除
user_groups:
  - Alumni
```

### ステップ4: 動作確認

更新後は以下で確認を行ってください：

1. **ファイル整合性チェック**:
```bash
# 日本語版と英語版の username 一致確認
for dir in content/authors/*/; do
    ja_author=$(grep "authors:" $dir/_index.ja.md | grep -v "^#" | sed 's/.*- //')
    en_author=$(grep "authors:" $dir/_index.en.md | grep -v "^#" | sed 's/.*- //')
    if [ "$ja_author" != "$en_author" ]; then
        echo "WARNING: Author mismatch in $dir"
    fi
done
```

2. **Weight値の重複チェック**:
```bash
# 現役メンバーのweight重複確認（同学年の場合は正常）
grep -h "^weight:" content/authors/*/_index.ja.md | grep -v "^weight:$" | sort | uniq -c | awk '$1 > 1 {print "重複weight: " $2 " " $3 " (" $1 "回)"}'
```

3. **Hugo サーバーでの表示確認**:
```bash
hugo server -D
```
ブラウザで `http://localhost:1313/members/` にアクセスして表示を確認

## 重要な注意事項

### 1. 進学・卒業の判断について
- **B4からM1**: 全員が自動進学するわけではありません。実際の進学状況を確認してください
- **M2からD1**: 博士課程進学は稀です。個別に確認が必要です
- **卒業処理**: 学部4年生や修士2年生が必ずしも卒業するとは限りません

### 2. ファイル操作の注意点
- 必ず日本語版と英語版の両方を更新してください
- `authors` フィールドのusernameは変更しないでください
- プロファイル画像（`avatar.png`）はそのまま維持してください

### 3. バックアップ推奨
大規模な更新前には以下でバックアップを作成することを推奨します：
```bash
cp -r content/authors content/authors_backup_$(date +%Y%m%d)
```

### 4. 段階的実行
- 大量のメンバー更新時は、少数ずつ実行して動作確認することを推奨
- エラーが発生した場合は、個別ファイルを手動で修正してください

## 参考情報

### 現在のWeight値体系
```
職員系:
- 准教授: 100
- 学術研究員: 10

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
| 職員 | Staff | 教員・職員 |
| 学部生 | Undergraduate Students | B3, B4 |
| 修士課程 | Master's Students | M1, M2 |
| 博士課程 | Doctoral Students | D1, D2, D3 |
| メンバー | Members | 現役全員 |
| 学生 | Students | 現役学生全員 |
| 卒業生 | Alumni | 卒業生・修了生 |

## トラブルシューティング

### よくある問題と解決方法

1. **Hugo サーバーエラー**:
   - YAML構文エラーの可能性があります。各ファイルの構文を確認してください
   - 特に `user_groups` のインデントに注意してください

2. **メンバーが表示されない**:
   - `user_groups` が正しく設定されているか確認してください
   - `content/members.ja.md` と `content/members.en.md` の設定を確認してください

3. **順序が正しくない**:
   - `weight` 値が正しく設定されているか確認してください
   - 同じweight値の重複がないか確認してください

このプロンプトにより、研究室メンバーのステータス更新を効率的かつ正確に実行できます。