# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.13.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.13.0/clab_v0.13.0_darwin_arm64.tar.gz"
      sha256 "5b390baccef9af8968b1bed23ee6e7126d85ae35f66406fba411511be0d00f9e"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.13.0/clab_v0.13.0_darwin_amd64.tar.gz"
      sha256 "763999e61df4007ccc79a20967eb2fb26a88c76768447998b341c052a7acbe20"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.13.0/clab_v0.13.0_linux_arm64.tar.gz"
      sha256 "fc91a04f577f3474d7f90aba112f601189a7f3d3d07d994269c1323a0ea0a1f0"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.13.0/clab_v0.13.0_linux_amd64.tar.gz"
      sha256 "dccbede5beb1bc0e69e9d4b6ec64097e8e56a22d8c706c91ad2e24dcd435f3b3"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.13.0", shell_output("#{bin}/clab version")
  end
end
