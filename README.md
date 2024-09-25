# homebrew-vcfcli
Homebrew tap for the VCF CLI

## Installation

```console
brew tap vmware/homebrew-vcfcli # Only needs to be done once for the machine

brew install vcf-cli
```

To upgrade to a new release: `brew update && brew upgrade vcf-cli`

To uninstall: `brew uninstall vcf-cli`

Installing with Homebrew will automatically setup shell completion for
`bash`, `zsh` and `fish`.

### Installing a Specific Version

At the time of writing, Homebrew only officially supported installing the
latest version of a formula, however the following workaround allows to install
a specific version by first extracting it to a local tap:

```console
brew tap-new local/tap
brew extract --version=1.0.0 vmware/homebrew-vcfcli/vcf-cli local/tap
brew install vcf-cli@1.0.0

# To uninstall such an installation
brew uninstall vcf-cli@1.0.0
```