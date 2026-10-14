# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.6.0/clab_v0.6.0_darwin_arm64.tar.gz"
      sha256 "1a3a5d86ade1549f13a749c1e28f5a2cb4b3106ac2c27cf4f5b65e01ccfe06c9"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.6.0/clab_v0.6.0_darwin_amd64.tar.gz"
      sha256 "d691488ab664da91d0595f48b07d3341ee4c073abe7375847e29d6e6de3d29ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.6.0/clab_v0.6.0_linux_arm64.tar.gz"
      sha256 "9cf627a6dc87673b43ba3ee920021a15335776546f4702e45c5846fa0be78879"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.6.0/clab_v0.6.0_linux_amd64.tar.gz"
      sha256 "19a8e97c4227b6f3c6fce41864bd7abf242593185da5b02805532774120b5535"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.6.0", shell_output("#{bin}/clab version")
  end
end
