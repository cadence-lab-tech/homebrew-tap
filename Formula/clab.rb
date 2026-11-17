# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.28.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.28.0/clab_v0.28.0_darwin_arm64.tar.gz"
      sha256 "171f00eca5129dbf2edb82609350bd394d31db211dbee5c77d1b8892f468e8f4"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.28.0/clab_v0.28.0_darwin_amd64.tar.gz"
      sha256 "ef81fac0a1a8089f0470516e77fae9378f6d3c8ab001dc89699e7b2ee3a26df0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.28.0/clab_v0.28.0_linux_arm64.tar.gz"
      sha256 "32992b0cf0f0129472f1e527048530df2411433f1b3ab7343259dbdb0c529fe5"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.28.0/clab_v0.28.0_linux_amd64.tar.gz"
      sha256 "a1ff5ecd43e3220401f8664ff0ffd88add87519cb00ab805ec2e86196f29fb94"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.28.0", shell_output("#{bin}/clab version")
  end
end
