# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.17.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.17.0/clab_v0.17.0_darwin_arm64.tar.gz"
      sha256 "2207e962c447e7b952e857bfb141b659d0ceb6bd5f1e221ef8444e365ec755f1"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.17.0/clab_v0.17.0_darwin_amd64.tar.gz"
      sha256 "87d34f26053ebbbab97aa07ee55ecd805295296459b9eefbe97620d7fba83002"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.17.0/clab_v0.17.0_linux_arm64.tar.gz"
      sha256 "c65a2fb7affa99942b9d7f945f891430c1122ec1e82eacc106d07262d0160501"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.17.0/clab_v0.17.0_linux_amd64.tar.gz"
      sha256 "55be08be2a4a2b73447cb93bcb63efc335f73a4f78e83efa88f675743a700c95"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.17.0", shell_output("#{bin}/clab version")
  end
end
