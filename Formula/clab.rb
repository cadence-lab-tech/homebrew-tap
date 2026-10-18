# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.7.0/clab_v0.7.0_darwin_arm64.tar.gz"
      sha256 "b8eb2c87e681134f7958eb5dc170ae97676ac738b1e8a160c5bf7b2aba2771f4"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.7.0/clab_v0.7.0_darwin_amd64.tar.gz"
      sha256 "a1eef67e8416000ae5b0a1507b7d3746c8f4f9be2d118a640f704171fdc17e2d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.7.0/clab_v0.7.0_linux_arm64.tar.gz"
      sha256 "7a5c7f9dcc5651632a833cfd2dfb27d8b5d6e00c2792b67b0e4f64c2f7e01aeb"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.7.0/clab_v0.7.0_linux_amd64.tar.gz"
      sha256 "63020abfd3444279d258c817e95f890c9a523f4d787c5f2bbbee5ac4968e3741"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.7.0", shell_output("#{bin}/clab version")
  end
end
