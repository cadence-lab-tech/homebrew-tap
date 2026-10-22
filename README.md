<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/logo-mark-dark.svg">
  <img src="assets/logo-mark-light.svg" alt="Cadence Lab" height="48">
</picture>

# Cadence Lab Homebrew tap

`clab` is the command-line interface of
[Cadence Lab](https://github.com/cadence-lab-tech/self-hosted): tasks, gates,
approvals and connecting an agent over MCP, from the terminal.

```bash
brew trust cadence-lab-tech/tap          # Homebrew 6: third-party taps load only after you trust them
brew install cadence-lab-tech/tap/clab
clab auth login --host https://<your instance>
```

The formula installs `clab` and `clab-runner`. Upgrade with `brew upgrade clab`.

The tap and the releases are public: no GitHub token and no membership in
the organization are needed. Archives for macOS, Linux and Windows live in
[the releases of this repository](https://github.com/cadence-lab-tech/homebrew-tap/releases);
the formula downloads them by direct link and verifies the checksum from
`checksums.txt`.

## Source and license

The CLI is part of Cadence Lab, whose source is available under the
[Functional Source License 1.1, ALv2 Future License](LICENSE) (FSL-1.1-ALv2):
the service and the CLI live in
[`sdlc-pipeline-backend`](https://github.com/cadence-lab-tech/sdlc-pipeline-backend),
the UI in
[`sdlc-pipeline-frontend`](https://github.com/cadence-lab-tech/sdlc-pipeline-frontend).
You may run it for your company, change it and use it for any purpose except
offering it to others as a competing product or service; each version becomes
Apache 2.0 two years after its release. A company runs the service on its own
machine from the [`self-hosted`](https://github.com/cadence-lab-tech/self-hosted)
package, and agents connect to that instance with this CLI. The scripts in
this repository are under the same license.

## Without Homebrew

`install.sh` downloads the archive for your platform together with
`checksums.txt`, verifies the checksum and puts `clab` and `clab-runner` into
`/usr/local/bin` or `~/.local/bin`:

```bash
curl -fsSL https://raw.githubusercontent.com/cadence-lab-tech/homebrew-tap/main/install.sh | sh
```

`CLAB_VERSION=v0.1.0` picks a specific release, `CLAB_INSTALL_DIR` the
directory to install into.

Windows: take `clab_<version>_windows_amd64.zip` from the
[latest release](https://github.com/cadence-lab-tech/homebrew-tap/releases/latest),
unpack it and put `clab.exe` into a directory on `PATH`. No token is needed
for the download.

## How the formula is updated

`release.yml` in
[`sdlc-pipeline-backend`](https://github.com/cadence-lab-tech/sdlc-pipeline-backend)
builds the archives on a `v*` tag, publishes them as a release **here** and
sends a `repository_dispatch` (`clab-release`) with the tag and the contents
of `checksums.txt`. `.github/workflows/update.yml` renders `Formula/clab.rb`
with `bin/formula.sh` and commits it. By hand, if the event did not arrive:

```bash
gh release download v0.1.0 --repo cadence-lab-tech/homebrew-tap --pattern checksums.txt
gh workflow run update.yml --repo cadence-lab-tech/homebrew-tap \
    -f tag=v0.1.0 -f checksums="$(cat checksums.txt)"
```

To check the formula locally before pushing:

```bash
brew trust --tap file://$PWD && brew tap cadence-lab-tech/tap file://$PWD
brew install --verbose clab && brew test clab
```
