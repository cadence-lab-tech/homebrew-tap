# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.21.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.21.0/clab_v0.21.0_darwin_arm64.tar.gz"
      sha256 "f9285d380b3df949623c9000fbce65f0f29c21dd32da73eb324c4d02a70cfecb"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.21.0/clab_v0.21.0_darwin_amd64.tar.gz"
      sha256 "cce423610c328885d6e1fddb5237c40f5810da3d1f11e621cbe08d46639e0a72"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.21.0/clab_v0.21.0_linux_arm64.tar.gz"
      sha256 "d20e4527c7cf228be02a7c1ffc3e755c6bf14e982b016cff0053ed7baf643652"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.21.0/clab_v0.21.0_linux_amd64.tar.gz"
      sha256 "885a8424bac6f47515169def19a3de276e2b3c82a0bd6c1ef01ab54ec218db44"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.21.0", shell_output("#{bin}/clab version")
  end
end
