# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.
require_relative "../lib/private_strategy"

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/sdlc-pipeline-backend"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/sdlc-pipeline-backend/releases/download/v0.2.0/clab_v0.2.0_darwin_arm64.tar.gz",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "d79201c73c55626245d2f096bd4e7936fe7e8dd169cd227e0fad00c7dc3c2a3d"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/sdlc-pipeline-backend/releases/download/v0.2.0/clab_v0.2.0_darwin_amd64.tar.gz",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "335233469d7bf44f704ce292aa26fa7dd1354d9a26fce1b8bbe00a23e4ee6c56"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/sdlc-pipeline-backend/releases/download/v0.2.0/clab_v0.2.0_linux_arm64.tar.gz",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "9689cb093186f0fe06d073f46b2ede421f7760d34c0b6e309a683d7903b57bb7"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/sdlc-pipeline-backend/releases/download/v0.2.0/clab_v0.2.0_linux_amd64.tar.gz",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "5f5b25f8714c776a47a70d60cf18793e28a0e8b47f1c619f15cda4fdc4b9b753"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.2.0", shell_output("#{bin}/clab version")
  end
end
