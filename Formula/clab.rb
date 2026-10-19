# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.9.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.9.0/clab_v0.9.0_darwin_arm64.tar.gz"
      sha256 "631e25c35c0d50dff33897b3a7afb44a469c55830a6c703aa84a9dc1bab344dc"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.9.0/clab_v0.9.0_darwin_amd64.tar.gz"
      sha256 "c11af0c2b433f92a4f2263be4fda86065e16a53dffbc7312610d35dd3e73537c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.9.0/clab_v0.9.0_linux_arm64.tar.gz"
      sha256 "36bcd094511b4ae2732b6ad99688635f119fee1f2ea151dc964b3b178cf8d4b2"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.9.0/clab_v0.9.0_linux_amd64.tar.gz"
      sha256 "73b956fba10edc353cad253830edda69d364cc2c2c5729db3ad5d5dc47688801"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.9.0", shell_output("#{bin}/clab version")
  end
end
