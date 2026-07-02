# C4G Homebrew tap

```bash
brew tap c4g-john/tap
brew install docassert
```

| Formula | What it is |
|---|---|
| `docassert` | [Unit testing for business documents](https://github.com/c4g-john/docassert) — the [PMO as Code](https://c4g-john.github.io/pmo-as-code/) reference implementation. |

The formula installs the structural core. For the optional extras use pip/pipx
instead (`pipx install "docassert[ai,convert]"`), or inject them:

```bash
pipx install docassert   # alternative to brew, with extras available
```

Apache-2.0 · © 2026 C4G Enterprises Inc.
