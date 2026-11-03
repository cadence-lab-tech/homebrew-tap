# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.23.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.23.0/clab_v0.23.0_darwin_arm64.tar.gz"
      sha256 "99b633039914b71a82fc3d8bd02d5632537552ba51e8c7334e22a38aa45eac73"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.23.0/clab_v0.23.0_darwin_amd64.tar.gz"
      sha256 "3415a1f4d5c30f282e54e493e01097ddae9fc1fe33e495e226fe241fc4242391"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.23.0/clab_v0.23.0_linux_arm64.tar.gz"
      sha256 "d28b62f8daad7e97df595f1613dece2cefe26be9af70d8915b063640c51a891c"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.23.0/clab_v0.23.0_linux_amd64.tar.gz"
      sha256 "9ce29132847d19ea7b6dbecb62911c022df9225a700e21a408a15f29742fe04d"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.23.0", shell_output("#{bin}/clab version")
  end
end
