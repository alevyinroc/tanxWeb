# Instructions

This repository contains the build resources for a website supporting the TAN[X] FRC team. It will be built by the Jekyll static site generator and hosted on Github Pages, built and deployed through Github Pages.

## Current Site

The current site is at https://tanxrobotics.com/ and we will be updating DNS to point this hostname at the Github Pages location once we're ready to go live.

## Appearance

Initially, we just want to replicate the theme and content of the current site as closely as possible.

### Page-Specific

|Page|Notes|
|----|----|
|Sponsorship|Sections need to be maintained for each sponsorship level. Sponsor logo sizes are directly correlated to the sponsorship level - Gold has the largest logos, Silver the next size down, etc.|
|Our Robots|Each robot image should link to another page which details that year's robot, game, and results. This is not complete on the current site. Create placeholder pages for any year missing between 2009 and 2026.|

### Future Work

We will add each year's sponsors to that year's robot page. We aren't ready to do this yet.

## Workflow & Maintenance

As you work, keep notes of how things work, and what needs to be done to maintain the site. Multiple people may be working on the site simultaneously, so supporting pull requests and merges of in-progress work is important.

Often, students will be working on Windows PCs with restricted user accounts, so if anything needs to be installed to run a local copy of the tools or website, they need to be installable into their user profiles, not the whole computer. There will also need to be scripts (batch or shell scripts) for doing local site builds and running the local server.

Mentors may also be working on the site, using their own Macs or PCs.

Setup, local preview scripts, and deployment are documented in README.md. How the site is structured and how to make common edits (sponsors, season pages, images), plus known content issues to verify, are in MAINTAINING.md. Keep both up to date.
