---
title: Our Robots
permalink: /our-robots.html
section_class: section--dark
banner:
  image: /assets/images/backgrounds/our-robots-banner.jpg
  height: 500
  position: 50% 64%
---
{%- comment -%}
  This list is built automatically from the files in _robots/ (newest first).
  To change a robot's picture, set `menu_image` in _robots/<year>.md.
{%- endcomment -%}
## **Our Robots**

Click on one of our robots to see information about that season.
{: .text-center .muted}

{% assign robots = site.robots | sort: "year" | reverse -%}
<div class="robot-grid" markdown="0">
{%- for robot in robots %}
{%- if robot.menu_image %}
  <a class="robot-card" href="{{ robot.url | relative_url }}" title="{{ robot.title }}">
    <img src="{{ robot.menu_image | relative_url }}" alt="Team 3003's {{ robot.year }} robot" loading="lazy">
  </a>
{%- else %}
  <a class="robot-card robot-card--placeholder" href="{{ robot.url | relative_url }}" title="{{ robot.title }}">
    <span class="robot-year">{{ robot.year }}</span>
    {%- if robot.game %}<span>{{ robot.game }}</span>{% endif %}
    <span class="robot-soon">Details coming soon</span>
  </a>
{%- endif %}
{%- endfor %}
</div>
