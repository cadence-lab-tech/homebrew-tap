# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.3.0/clab_v0.3.0_darwin_arm64.tar.gz"
      sha256 "2b5b6f6af3e5133c6c28431c0988d2578096b86d305b6fd1738fb1382dfdfccf"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.3.0/clab_v0.3.0_darwin_amd64.tar.gz"
      sha256 "50d67d3fa882104801e71b934ae8571888e42ef56d481827c47b9a91e0a189c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.3.0/clab_v0.3.0_linux_arm64.tar.gz"
      sha256 "5e30bc3876085325652addca7015f31f98308a3aa3ac0ed049473b5ba9c3a3ba"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.3.0/clab_v0.3.0_linux_amd64.tar.gz"
      sha256 "7f6204eb844fd5e5bd3fec571fddaab613bedb7484dd0e4974346cdcb7115ad8"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.3.0", shell_output("#{bin}/clab version")
  end
end
