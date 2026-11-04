# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.24.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.24.0/clab_v0.24.0_darwin_arm64.tar.gz"
      sha256 "5ddbe2f3c6e947d7c4bd95af3afa350573b9dcfa85c44a3884bf6696d14c0cba"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.24.0/clab_v0.24.0_darwin_amd64.tar.gz"
      sha256 "b0c1c51f89f1ea37d18199e191c77e027c6e7ab3fe13ea65c0c71c63ddea10e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.24.0/clab_v0.24.0_linux_arm64.tar.gz"
      sha256 "3cfc58e7e324604491a2427e95506cfcb9a41cdb666374bf6ef26dc60d7790e9"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.24.0/clab_v0.24.0_linux_amd64.tar.gz"
      sha256 "cebf90ab2a148988e28bb728b7f261eb784e2053e596352817a84f7fec2be893"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.24.0", shell_output("#{bin}/clab version")
  end
end
