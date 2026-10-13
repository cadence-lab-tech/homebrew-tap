# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.5.3"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.5.3/clab_v0.5.3_darwin_arm64.tar.gz"
      sha256 "de7ef954c98b556bd9504b0dfaaaab5ff9d29980260831b2583f031783da0b1c"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.5.3/clab_v0.5.3_darwin_amd64.tar.gz"
      sha256 "ba229cb3cc9842ccadd2b8101deae6b9e20abb8108af0ee99b1c7ea5e178cfe5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.5.3/clab_v0.5.3_linux_arm64.tar.gz"
      sha256 "e259cea26580be2228225621e3d45ff5145fd0ca06bac7fdd62369a13142087f"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.5.3/clab_v0.5.3_linux_amd64.tar.gz"
      sha256 "ecec4972a8ddc6c488bf88a8b4ca16c52ef5067712d0961693ee8b486b2f614e"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.5.3", shell_output("#{bin}/clab version")
  end
end
