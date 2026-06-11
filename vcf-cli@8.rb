# Copyright 2023 VMware, Inc. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

class VcfCliAT8 < Formula
  desc "VCF command-line tool"
  homepage "https://github.com/vmware/homebrew-vcfcli"
  version "8.0.3"

  checksums = {
    "darwin-amd64" => "13264844161893fa2ef85ecae62095b1061975fc896a84da24f80b420214da65",
    "darwin-arm64" => "7ecba4a8f286d6cd1fcf4441264c90309a7e0dde44206724d8dec7de65145231",
  }

  $arch = "arm64"
  on_intel do
    $arch = "amd64"
  end

  $os = "darwin"

  url "https://packages.broadcom.com/artifactory/vcf-distro/vcf-cli/#{$os}/#{$arch}/v#{version}/vcf-cli.tar.gz"
  sha256 checksums["#{$os}-#{$arch}"]

  def install
    # Install the VCF CLI
    bin.install "vcf-cli-#{$os}_#{$arch}" => "vcf"
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
