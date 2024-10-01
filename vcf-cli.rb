# Copyright 2023 VMware, Inc. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

class VcfCli < Formula
  desc "VCF command-line tool"
  homepage "https://github.com/vmware/homebrew-vcfcli"
  version "1.1.0"

  checksums = {
    "darwin-amd64" => "811669f852ab5e760745cc1e7432f0b5e47b579d414e14d529a93d14060f7425",
    "darwin-arm64" => "25b715db809a024cc6663dc5b8841dd4b23aa0b0a1a73fbc92ea3fdfac3972e6",
  }

  arch = "arm64"
  on_intel do
    arch = "amd64"
  end

  os = "darwin"

  url "https://packages.broadcom.com/artifactory/vcf-distro/vcf-cli/#{os}/#{arch}/v#{version}/vcf-cli.tar.gz"
  sha256 checksums["#{os}-#{arch}"]

  def install
    # Install the VCF CLI
    bin.install "vcf-cli" => "vcf"

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
