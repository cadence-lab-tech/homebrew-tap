# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.26.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.26.0/clab_v0.26.0_darwin_arm64.tar.gz"
      sha256 "bada5f70082ffa51d959d79c45e91db2a1c418bca53cd9ec892768f14df2dd45"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.26.0/clab_v0.26.0_darwin_amd64.tar.gz"
      sha256 "ab2b0136dbf379d14a422e7dd0f0b2ff4a5a4473bd59674436e0c7138df3ac08"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.26.0/clab_v0.26.0_linux_arm64.tar.gz"
      sha256 "76879f30e4d6e30a89a9ad83c3ac5b8b99a0e80b4054e7e3bfc908e6def418f8"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.26.0/clab_v0.26.0_linux_amd64.tar.gz"
      sha256 "bf91c502cdc5ecddad134eceab73d0abc74870b84e7b39632994bc6ee219e3e5"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.26.0", shell_output("#{bin}/clab version")
  end
end
