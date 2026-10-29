# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.18.1"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.18.1/clab_v0.18.1_darwin_arm64.tar.gz"
      sha256 "87637f29f55e32899124d3f674a619382ce0cc1dac278ff56ac79ddea9114f87"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.18.1/clab_v0.18.1_darwin_amd64.tar.gz"
      sha256 "668293a9873f573cbf11b551596eaf791a50f0f7a5a828489803fb6e8554fec1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.18.1/clab_v0.18.1_linux_arm64.tar.gz"
      sha256 "a60a5fa1a6e36521106ee8261e6d4ffd41db8ce084126bbc40371aa15b28e204"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.18.1/clab_v0.18.1_linux_amd64.tar.gz"
      sha256 "cba629076403ddf6bf5c6e1a024974ddf073c7feebfcfe704be394026f5ea62e"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.18.1", shell_output("#{bin}/clab version")
  end
end
