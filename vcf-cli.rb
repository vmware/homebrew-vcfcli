# Copyright 2023 VMware, Inc. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

class VcfCli < Formula
  desc "The core VCF command-line tool"
  homepage "https://github.com/vmware/homebrew-vcfcli"
  version "1.0.0"

  checksums = {
    "darwin-amd64" => "811669f852ab5e760745cc1e7432f0b5e47b579d414e14d529a93d14060f7425",
    "darwin-arm64" => "d9ec62a8e774ab42bc68182177b48c54fe653226fc796bbfe92e3cf013992f59",
  }

  arch = "arm64"
  on_intel do
    arch = "amd64"
  end

  os = "darwin"

  url "https://packages.broadcom.com/artifactory/vcf-cli/#{os}/#{arch}/v#{version}/vcf-cli.tar.gz"
  sha256 checksums["#{os}-#{arch}"]

  def install
    # Install the VCF CLI
    bin.install "vcf-cli" => "vcf"

    # Setup shell completion
    output = Utils.safe_popen_read(bin/"vcf", "completion", "bash")
    (bash_completion/"vcf").write output

    output = Utils.safe_popen_read(bin/"vcf", "completion", "zsh")
    (zsh_completion/"_vcf").write output

    output = Utils.safe_popen_read(bin/"vcf", "completion", "fish")
    (fish_completion/"vcf.fish").write output
  end

  # This verifies the installation
  test do
    # DO NOT set the eula or ceip values here as they would be persisted
    # for the user's release installation.  Instead, just use commands that
    # don't trigger the prompts.

    assert_match "version: v#{version}", shell_output("#{bin}/vcf version")
    output = shell_output("#{bin}/vcf plugin -h")
    assert_match "Manage CLI plugins", output
  end
end
