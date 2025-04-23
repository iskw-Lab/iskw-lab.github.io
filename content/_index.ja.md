---
# ホームページのタイトルは空にしてサイトタイトルを使用
title: 石川研究室
type: landing

sections:
  # Hero Block: 研究室のメイン紹介
  - block: hero
    content:
      title: __石川研究室__
      image:
        filename: welcome.png
      text: |
        **静岡大学 情報学部**

        人と人、人と技術の関わり方を理解し、誰もが幸せに暮らせる社会を実現するための研究に取り組んでいます。
    design:
      background:
        image_darken: 0.7
        text_color_light: false

  # About Block: 研究室の簡単な紹介文
  - block: markdown
    id: about
    content:
      title: 研究室について
      text: |
        静岡大学情報学部の石川翔吾研究室では、インタラクションの理解を通してフィールドの多様性を学び、共同創造によって誰もがWell-beingになるための仕組みを創造することを目指して研究を実施しています。

        主な研究分野として、以下のテーマに取り組んでいます：

        - **個人伴走型Well-being copilot技術**：テクノロジーによって誰もがWell-beingを享受することを目的に、人-人や人-機械のインタラクションにおける目標達成支援の仕組みを研究
        - **AI技術を活用した障害のある当事者・ケア従事者支援**：障害のある人の生活に伴走しリカバリーを促すためのAI技術を活用したセルフケア支援システム、ケア従事者のケアスキル向上のためのケアサポートシステムの開発
        - **ナラティブの理解と共同創造**：多様な共生社会における当事者のナラティブを理解する技術開発と、当事者と共に生きやすい仕組みの創造
        - **XR技術を活用した心の理解と社会的実践**：VRやメタバース技術を活用したPX(Patient eXperience)体験プラットフォームの開発と経験拡張の効果検証
    design:
      columns: '1'

  # People Block: チームメンバーへのリンク
  - block: markdown
    id: members
    content:
      title: メンバー紹介
      text: |
        {{% cta cta_link="./members/" cta_text="メンバー一覧を見る →" %}}
    design:
      columns: '1'

  # Publications Collection Block: 最近の出版物
  - block: collection
    id: publications
    content:
      title: 最近の研究成果
      text: ''
      count: 5
      filters:
        folders:
          - publication
        exclude_featured: false
      order: desc
    design:
      view: citation
      columns: '1'

  # Contact Block: 連絡先情報
  - block: contact
    id: contact
    content:
      title: お問い合わせ
      email: ishikawa-s[@]inf.shizuoka.ac.jp
      address:
        street: 中央区 城北 3-5-1
        city: 浜松市
        region: 静岡県
        postcode: '432-8011'
        country: 日本
        country_code: JP
      autolink: true
    design:
      columns: '1'
--- 