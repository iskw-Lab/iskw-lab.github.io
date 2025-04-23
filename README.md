# Ishikawa Lab. Website

This repository manages the source code for the Ishikawa Lab. website.

## サイトの構成

サイトは以下の主要なセクションで構成されています：

1. **メンバー情報** (`content/authors/`)
   - 研究室メンバーのプロフィール
   - 研究関心分野
   - 学歴
   - ソーシャルリンク
   - [メンバー情報の登録方法](content/authors/README_authors.md)

2. **研究業績** (`content/publication/`)
   - 学術論文
   - 学会発表
   - その他の研究成果
   - [研究業績の登録方法](content/publication/README_publication.md)

3. **研究プロジェクト** (`content/project/`)
   - 進行中の研究プロジェクト
   - プロジェクト概要
   - メンバー構成
   - 関連する研究業績
   - [プロジェクトの登録方法](content/project/README_project.md)

## 開発環境のセットアップ

1. Hugoのインストール（https://gohugo.io/）
   ```bash
   # macOSの場合
   brew install hugo
   ```

2. リポジトリのクローン
   ```bash
   git clone https://github.com/iskw-Lab/iskw-lab.github.io.git
   cd iskw-lab.github.io
   ```

3. 依存関係のインストール
   ```bash
   hugo mod get -u
   ```

4. ローカルサーバーの起動
   ```bash
   hugo server -D
   ```

## コンテンツの更新方法

各セクションのコンテンツ更新方法については、それぞれのREADMEを参照してください：

- [メンバー情報の更新](content/authors/README_authors.md)
- [研究業績の更新](content/publication/README_publication.md)
- [プロジェクト情報の更新](content/project/README_project.md)

## 研究業績の追加ワークフロー

研究業績（論文、学会発表など）を追加する際の手順は以下の通りです：

1. **リポジトリの準備**
   - 初めての場合：
     ```bash
     git clone https://github.com/iskw-Lab/iskw-lab.github.io.git
     cd iskw-lab.github.io
     ```
   - すでにクローン済みの場合：
     ```bash
     cd iskw-lab.github.io
     git checkout main
     git pull origin main
     ```

2. **新しいブランチの作成**
   - 作業用のブランチを作成します(例: `add-publication-論文タイトル`)
   ```bash
   git checkout -b add-publication-論文タイトル
   ```

3. **研究業績の追加**
   - 方法1: スクリプトを使用する場合
     ```bash
     chmod +x scripts/create_publication.sh
     ./scripts/create_publication.sh 会議名 著者名
     # 例: ./scripts/create_publication.sh CHI atsushi-omata
     ```
     - [研究業績の登録方法](content/publication/README_publication.md)を参照して、必要な項目を記入してください
   - 方法2: 手動で作成する場合
     - `content/publication/` ディレクトリに新しいディレクトリを作成
     - ディレクトリ名は `YYYYMMDD-会議名-著者名` の形式で作成
     - その中に `index.ja.md` と `index.en.md` ファイルを作成し、[研究業績の登録方法](content/publication/README_publication.md)に従って記入
     - 関連する画像がある場合は、同じディレクトリに配置

4. **変更の確認**
   - ローカルで変更を確認します
   ```bash
   hugo server -D
   ```
   - ブラウザで `http://localhost:1313` にアクセスし、変更が正しく反映されているか確認

5. **変更のコミットとプッシュ**
   ```bash
   git add .
   git commit -m "Add: 論文タイトル by 著者名"
   git push origin add-publication-論文タイトル
   ```

6. **プルリクエストの作成**
   - GitHubで `iskw-Lab/iskw-lab.github.io` リポジトリにアクセス
   - プッシュしたブランチからプルリクエストを作成
   - プルリクエストのタイトルは `Add: 論文タイトル by 著者名` の形式で作成
   - 変更内容の説明を詳細に記入

7. **レビューとマージ**
   - 教員がプルリクエストをレビュー
   - 必要に応じて修正を依頼
   - 問題がなければマージ

8. **ローカルリポジトリの更新**
   - プルリクエストがマージされたら、ローカルリポジトリを更新
   ```bash
   git checkout main
   git pull origin main
   ```

### 注意事項
- プルリクエストを作成する前に、必ずローカルで変更を確認してください
- 研究業績の追加時は、[研究業績の登録方法](content/publication/README_publication.md)に記載されている必須項目をすべて記入してください
- 画像ファイルは適切なサイズに圧縮し、ファイルサイズを小さくしてください
- プルリクエストの説明には、追加した研究業績の概要を簡潔に記入してください

## デプロイ

このサイトはGitHub Pagesを使用してデプロイされています。`main`ブランチへのプッシュが自動的にデプロイをトリガーします。

## コンテンツレイアウト参考

- [Hugo Bootstrap Theme](https://bootstrap.hugoblox.com/content/)
- [Hugo Bootstrap Themeのドキュメント](https://docs.hugoblox.com/)
- [Hugo Research Group Theme](https://github.com/wowchemy/starter-hugo-research-group)

## ライセンス

このサイトは[Hugo Research Group Theme](https://github.com/wowchemy/starter-hugo-research-group)をベースにしています。

## クレジット

- テーマ: [Hugo Research Group Theme](https://github.com/wowchemy/starter-hugo-research-group)
- アイコン: [Font Awesome](https://fontawesome.com/)
- フォント: [Google Fonts](https://fonts.google.com/)
