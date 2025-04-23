#!/bin/bash

# 日付を取得（YYYYMMDD形式）
DATE_DIR=$(date +%Y%m%d)
# 日付を取得（YYYY-MM-DD形式）
DATE_ISO=$(date +%Y-%m-%d)

# 引数の確認
if [ $# -lt 2 ]; then
    echo "Usage: $0 <conference_name> <author_name>"
    echo "Example: $0 CHI atsushi-omata"
    exit 1
fi

CONF_NAME=$1
AUTHOR_NAME=$2
DIR_NAME="${DATE_DIR}-${CONF_NAME}-${AUTHOR_NAME}"

# ディレクトリの作成
mkdir -p "content/publication/${DIR_NAME}"

# index.mdのテンプレートを作成
cat > "content/publication/${DIR_NAME}/index.ja.md" << EOL
---
title: "論文タイトル"
authors:
  - ${AUTHOR_NAME}
  - 共著者1
  - 共著者2
  - admin

date: '${DATE_ISO}T00:00:00Z'
publishDate: '${DATE_ISO}T00:00:00Z'

doi: ''

# README_publication.md を参照してつける
publication_types: 
  - paper-conference    

# README_publication.md を参照してつける．複数選択可能．
categories:
  - Domestic Conference

publication: In *${CONF_NAME}* # 正式名称に変更
publication_short: In *${CONF_NAME}* # 正式名称に変更

abstract: "論文の要約をここに記入してください。"

summary: ${CONF_NAME}にて発表しました． # 正式名称に変更

# 関連するプロジェクトがあれば記入 （care-dx, care-interaction, etc...）
# content/project/ のフォルダ名に一致するものを記入
projects:
  - 

# 使っている技術やキーワードを記入．自由に記入してください．
tags:
  - 

featured: false

links:
- name: ${CONF_NAME} # 正式名称に変更
  url: 

image:
  caption: ""
  focal_point: ""
  preview_only: false

url_pdf: ""   # PDFのURLがあれば記入
url_slides: "" # スライドのURLがあれば記入
url_video: "" # 動画のURLがあれば記入
url_code: ""  # コードのURLがあれば記入
url_dataset: "" # データセットのURLがあれば記入
url_project: "" # プロジェクトのURLがあれば記入
---
EOL

echo "テンプレートが生成されました: content/publication/${DIR_NAME}/index.ja.md"
echo "必要に応じて内容を編集してください。" 

cat > "content/publication/${DIR_NAME}/index.en.md" << EOL
---
title: "Paper Title"
authors:
  - ${AUTHOR_NAME}
  - Co-author 1
  - Co-author 2
  - Admin

date: '${DATE_ISO}T00:00:00Z'
publishDate: '${DATE_ISO}T00:00:00Z'

doi: ''

# README_publication.md を参照してつける
publication_types: 
  - paper-conference    

# README_publication.md を参照してつける．複数選択可能．
categories:
  - Domestic Conference

publication: In *${CONF_NAME}* # 正式名称に変更
publication_short: In *${CONF_NAME}* # 正式名称に変更

abstract: "論文の要約をここに記入してください。"

summary: We presented at ${CONF_NAME}. # 正式名称に変更

# 関連するプロジェクトがあれば記入 （care-dx, care-interaction, etc...）
# content/project/ のフォルダ名に一致するものを記入
projects:
  - 

# 使っている技術やキーワードを記入．自由に記入してください．
tags:
  - 

featured: false

links:
- name: ${CONF_NAME} # 正式名称に変更
  url: 

image:
  caption: ""
  focal_point: ""
  preview_only: false

url_pdf: ""   # PDFのURLがあれば記入
url_slides: "" # スライドのURLがあれば記入
url_video: "" # 動画のURLがあれば記入
url_code: ""  # コードのURLがあれば記入
url_dataset: "" # データセットのURLがあれば記入
url_project: "" # プロジェクトのURLがあれば記入
---
EOL

echo "テンプレートが生成されました: content/publication/${DIR_NAME}/index.en.md"
echo "必要に応じて内容を編集してください。" 
