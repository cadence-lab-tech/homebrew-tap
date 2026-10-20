# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.10.2"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.10.2/clab_v0.10.2_darwin_arm64.tar.gz"
      sha256 "1c5c27e7fab1d6752008247bdad7a6aab16d8981df3229c22752a949aa4aa659"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.10.2/clab_v0.10.2_darwin_amd64.tar.gz"
      sha256 "8d376dbbbce7b122fe544ddc5fd94255ac806ed561106360b58cf35e704e5477"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.10.2/clab_v0.10.2_linux_arm64.tar.gz"
      sha256 "991a18bc97144f0ec78a03c7ba1bb011434e169df5ade19a1026e3e24d511dd2"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.10.2/clab_v0.10.2_linux_amd64.tar.gz"
      sha256 "9fc08a0b881c6893f5b23d64159061193fe5d71f7d27cf373d213e63cc04612d"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.10.2", shell_output("#{bin}/clab version")
  end
end
