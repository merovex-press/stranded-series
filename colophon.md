# Colophon

<!-- colophon -->
This series uses the software industry [Continuous Delivery](https://en.wikipedia.org/wiki/Continuous_delivery) practice to automate rote book production activities. We automate by using [Circle CI](https://circleci.com/) and [Github Actions](https://github.com/features/actions). The specific actions are found in either the `.github` or `.circleci` directories in this repository. These automations use Docker

**Commit Style.**
In order to try to put some structure to my commits, I add the following "types" to commit messages using the format `<type>(<scope>): <subject>`.

1. **docs**: Shows progress in supporting materials (e.g. README, series bible, etc.)
5. **learn**: Capturing research work
1. **tidy**: Shows formatting, organization or other fixes that are otherwise immaterial.
3. **tool**: Shows improvement in toolchain
4. **typo**: Shows a correction to any work (whether for publication or not.)
6. **wip**: Shows forward progress in a for-publication work

* https://github.com/toolmantim/release-drafter#readme
* https://github.com/settings/installations/1239713

**Release.**
This repo manages Github Releases with [Release Drafter](https://github.com/apps/release-drafter). It automatically creates a `Draft` release and updates that draft with *Pull Requests*. There are pull-request-specific labels in the repo to help categorize the release notes. See [.github/release-drafter.yml](./.github/release-drafter.yml) for those labels.

**Changelog.**
This repos makes the Changelog using Using [Github Release Notes](https://github.com/github-tools/github-release-notes). Changelog format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).
* `gren changelog --override`
* Note: Do not use `gren release` as it will argue with Release Drafter.
* Note: I got overkill in August 2019 with v0.4.0 using `gren` to create the release (it ignored the draft release) off of commits.

**Readme Automation.** Some content in this README is pulled from the series documentation. The `make-readme.rb` custom script in `./bin` builds the readme.
<!-- /colophon -->
