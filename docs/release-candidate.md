# Ruby SDK Release Candidate

Issue: https://github.com/GeniusReferrals/Genius-Referrals-RUBY/issues/2
Contract source: https://github.com/alainhl/gr-agent-led-dev-delivery/issues/14

## Candidate

- Package: `genius_referrals`
- Version: `0.1.0`
- Channel: RubyGems
- Publication: not performed in this ticket

## Validation

Build the local candidate:

```bash
gem build genius_referrals.gemspec
sha256sum genius_referrals-0.1.0.gem
```

Run the repository gate:

```bash
ruby -Itest test/client_test.rb test/resources_test.rb
gem build genius_referrals.gemspec
```

Run the guarded live authentication smoke test only with an approved token:

```bash
GR_SDK_RUN_INTEGRATION=1 GR_API_TOKEN=... ruby -Itest test/integration/authentication_test.rb
```

## Rollback Or Removal

This ticket prepares an unpublished release candidate only. If validation fails,
delete the local `genius_referrals-0.1.0.gem`, fix the branch, rebuild, and
replace the PR evidence.

Public RubyGems publication, yanking, or release tagging requires Ledger risk
review and Alain approval.
