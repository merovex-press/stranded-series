module.exports = {
  includeMessages: "commits",
  ignoreCommitsWith: [
    "Testing",
    "skip",
    "working",
    "test",
    "trying"
  ],
  template: {
    commit: ({message, url, author, name}) => `- [${message}](${url}) - ${author ? `@${author}` : name}`,
    issue: "- {{name}} [{{text}}]({{url}})",
    label: "[**{{label}}**]",
    noLabel: "closed",
    group: "\n#### {{heading}}\n",
    changelogTitle: "# Changelog\n\n",
    release: "## {{release}} ({{date}})\n{{body}}",
    releaseSeparator: "\n---\n\n"
  },
  groupBy: {
    'Releases': [ 'release', 'publish' ],
    'Work in Progress': [ 'wip', 'docs', 'doc', 'research', 'learn' ],
    'Bug Fixes': [ 'fix', 'typo' ],
    'Maintenance': [ 'chore', 'feat', 'feature', 'clean' ]
  },
  ignoreIssuesWith: [
    "skip-changelog",
    "duplicate",
    "wontfix",
    "invalid",
    "help wanted"
  ],
  ignoreTagsWith: [
    "snapshot"
  ],
  dataSource: "prs",
  changelogFilename: "CHANGELOG.md",
  tags: "all",
  override: true,
  generate: true
}
