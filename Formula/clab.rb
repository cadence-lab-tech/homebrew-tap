# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.
require_relative "../lib/private_strategy"

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/sdlc-pipeline-backend"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/sdlc-pipeline-backend/releases/download/v0.1.0/clab_v0.1.0_darwin_arm64.tar.gz",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "31cec1088d689d47cd655bf2775b929c97227e6d743c8222fcca58e59c7aa5fa"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/sdlc-pipeline-backend/releases/download/v0.1.0/clab_v0.1.0_darwin_amd64.tar.gz",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "40f1218f228fb8d8d02e2a428031aeb5034720e04f0a7ebd0f8bd63858bdd69d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/sdlc-pipeline-backend/releases/download/v0.1.0/clab_v0.1.0_linux_arm64.tar.gz",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "3272858250a53e219d2a553a30c99627d800aa2bc11a3fb0e2e977a8ae097129"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/sdlc-pipeline-backend/releases/download/v0.1.0/clab_v0.1.0_linux_amd64.tar.gz",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "021a3e02579fa256f37254a268a521b0bc96100d658e1928861d4155ee5f2fba"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.1.0", shell_output("#{bin}/clab version")
  end
end
