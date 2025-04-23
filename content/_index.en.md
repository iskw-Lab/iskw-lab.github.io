---
# Use site title for homepage title
title: Ishikawa Lab
type: landing

sections:
  # Hero Block: Main introduction of the lab
  - block: hero
    content:
      title: __Ishikawa Lab__
      image:
        filename: welcome.png
      text: |
        **Faculty of Informatics, Shizuoka University**

        We conduct research to understand interactions and learn from field diversity, aiming to create mechanisms that enable everyone to achieve well-being through co-creation.
    design:
      background:
        image_darken: 0.7
        text_color_light: false

  # About Block: Brief introduction of the lab
  - block: markdown
    id: about
    content:
      title: About the Lab
      text: |
        At the Ishikawa Laboratory in the Faculty of Informatics, Shizuoka University, we conduct research to understand interactions and learn from field diversity, aiming to create mechanisms that enable everyone to achieve well-being through co-creation.

        Our main research areas include:

        - **Personal Well-being Copilot Technology**: Researching mechanisms to support goal achievement in human-human and human-machine interactions, aiming to enable everyone to enjoy well-being through technology
        - **AI Technology for Supporting People with Disabilities and Caregivers**: Developing and evaluating self-care support systems using AI technology to accompany people with disabilities and promote recovery, as well as care support systems to improve caregivers' skills
        - **Narrative Understanding and Co-creation**: Developing technologies to understand narratives of stakeholders in diverse inclusive societies and conducting practical research to create mechanisms for better living together with stakeholders
        - **XR Technology for Mental Understanding and Social Practice**: Developing PX (Patient eXperience) experience platforms using VR and metaverse technology to recreate the experiential world of people with disabilities in virtual space and verifying the effects of experience expansion
    design:
      columns: '1'

  # People Block: Link to team members
  - block: markdown
    id: members
    content:
      title: Meet the Team
      text: |
        {{% cta cta_link="./members/" cta_text="View Team Members →" %}}
    design:
      columns: '1'

  # Publications Collection Block: Recent publications
  - block: collection
    id: publications
    content:
      title: Recent Research
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

  # Contact Block: Contact information
  - block: contact
    id: contact
    content:
      title: Contact
      email: ishikawa-s[@]inf.shizuoka.ac.jp
      address:
        street: 3-5-1 Johoku, Chuo-ku
        city: Hamamatsu
        region: Shizuoka
        postcode: '432-8011'
        country: Japan
        country_code: JP
      autolink: true
    design:
      columns: '1'
---
