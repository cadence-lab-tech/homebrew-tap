# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.18.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.18.0/clab_v0.18.0_darwin_arm64.tar.gz"
      sha256 "1c5f1971fb0797974456b4b3666caf6652d5e5d0cf9c9ea8c8180dbf0390e1c4"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.18.0/clab_v0.18.0_darwin_amd64.tar.gz"
      sha256 "f5a69f2757fb909e08c3a6b2b8a34b74e70012f1a00caefaf8fd60d993fce6d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.18.0/clab_v0.18.0_linux_arm64.tar.gz"
      sha256 "673e4aa4c38c2a68fa9ad35e0e6383e3f189e9eb985900a4965a3731c80d2b1e"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.18.0/clab_v0.18.0_linux_amd64.tar.gz"
      sha256 "e6b96353f9866f2d9b28bae31780e2b5af455a8941d4a4dbc0f69359138cbfc4"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.18.0", shell_output("#{bin}/clab version")
  end
end
