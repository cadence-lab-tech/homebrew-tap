# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.10.1"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.10.1/clab_v0.10.1_darwin_arm64.tar.gz"
      sha256 "e179fe6cb30c24ca521df38fd5695c9d8e91056d3dc5762b56d58eabd11b4ca6"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.10.1/clab_v0.10.1_darwin_amd64.tar.gz"
      sha256 "67c74b90a64fe521800be22286bfa3a9889bb7e686ef7a2d59a78ffd0c3a87b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.10.1/clab_v0.10.1_linux_arm64.tar.gz"
      sha256 "84114f6ceec9bba120889d146f1bc16083fd934c417f9aa0495a1f71899e216d"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.10.1/clab_v0.10.1_linux_amd64.tar.gz"
      sha256 "826f13ff64f461de684347801785f8d9ea3cfe31f8344cde1c0e52896c606b97"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.10.1", shell_output("#{bin}/clab version")
  end
end
