### What's changed in v0.1.0

* feat: helm chart xrd (by @patrickleet)

* fix: standardize GitHub workflows (by @patrickleet)

* fix: use errors-only profile for e2e tests (by @patrickleet)

  - Add RBAC ClusterRoleBinding for Helm provider permissions
  - Use errors-only profile to reduce chart footprint (32 vs 61 deployments)
  - Disable asHook to speed up install
  - Increase timeout to 40 minutes for complex stack

  Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>

* chore: skip e2e tests for complex multi-component stack (by @patrickleet)

  Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


