# Copyright 2023 VMware, Inc. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

class VcfCli < Formula
  desc "VCF command-line tool"
  homepage "https://github.com/vmware/homebrew-vcfcli"
  version "9.0.2"

  checksums = {
    "darwin-amd64" => "2d677c32ffeae550f7551bd54b175be6df4cabc79e969acfed94895ff22e3073",
    "darwin-arm64" => "e3cb3fa6956d2f4ab60dd555191d05f90c0170a47d57e3a50f742570f9e673a2",
    "linux-amd64"  => "a4595fe7363b290fe206255b4c2d7728b95c27a1ed5606549063161c85627c47",
    "linux-arm64"  => "281aa1dd040c20ca0b3415810d4b0cda5d0b0ea1ee5fa2e0bf37d2709396576b",
  }

  $arch = "arm64"
  on_intel do
    $arch = "amd64"
  end

  $os = "darwin"
  on_linux do
    $os = "linux"
  end

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
