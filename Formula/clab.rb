# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  version "0.5.2"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.5.2/clab_v0.5.2_darwin_arm64.tar.gz"
      sha256 "a014146c00534992a6b5396764e6d45ba1fa52ef995243df8441766661583e80"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.5.2/clab_v0.5.2_darwin_amd64.tar.gz"
      sha256 "19d64c25b5aa62c11a55dc02564899d62e18925b9ea32ce06f44211692e4eee6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.5.2/clab_v0.5.2_linux_arm64.tar.gz"
      sha256 "2f3d25b067f39124087e769e5fb658edb2c32dbaa3a25718ad2431402b64a30d"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.5.2/clab_v0.5.2_linux_amd64.tar.gz"
      sha256 "5c1d11306b0e38d84f5742c291062b96798c317199668f54a0972a5897dd9abf"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.5.2", shell_output("#{bin}/clab version")
  end
end
