---
# TEMPLATE for a season page. Files starting with "_" are not published.
# Copy this to _robots/<year>.md (e.g. _robots/2027.md) and fill it in.
# The page will appear at /<year>-season.html and on the Our Robots page.
# Delete any field you don't need. Put images in assets/images/robots/<year>/
year: 2027
title: 2027 Season
game: Game Name

# Set to true while the page is still a stub; shows a "coming soon" note.
placeholder: false

# Image shown on the Our Robots page (the year is usually part of the image).
menu_image: /assets/images/robots/2027/menu.png

banner:
  image: /assets/images/robots/2027/banner.jpg
  position: 50% 50%
  height: 400
  logo: /assets/images/robots/2027/game-logo.png
  heading: 2027 Season

events_note: Optional text shown above the event list.
events:
  - name: Finger Lakes Regional - Rochester NY
    dates: March 10-13, 2027
    result: Rank 1 of 50 with a record of 12-0-0
    awards:
      - Excellence in Engineering Award
events_image: /assets/images/robots/2027/events.png
events_video: YOUTUBE_VIDEO_ID   # the part after "v=" in a YouTube link

links:
  - text: Robot CAD for FRC 2027
    url: https://drive.google.com/...
  - text: Robot Code for FRC 2027
    url: https://github.com/TANofX/...

reveal_video: https://www.youtube.com/watch?v=...
field_image: /assets/images/robots/2027/field.png

robot:
  name: Robot Name
  image: /assets/images/robots/2027/robot.png
  specs:
    Name: Robot Name
    Status: In Service
    Weight: 120lbs
  characteristics:
    - Swerve Drive
    - "**Bold text** works here too"

# Season Highlights photos: drop images into assets/images/robots/2027/gallery/
# Sponsors: shown at the bottom automatically when _data/sponsors/2027.yml exists.
---
Describe the game here in Markdown. This text appears under "The Game".
