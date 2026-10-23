# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.15.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.15.0/clab_v0.15.0_darwin_arm64.tar.gz"
      sha256 "514a418506772c8d41e67656a9e36f4d787f9ac54025599c15fdfc61b973b63b"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.15.0/clab_v0.15.0_darwin_amd64.tar.gz"
      sha256 "541997f4da578c68355d1004e0829aff36b700c0db5e72e6a9e0002870423e8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.15.0/clab_v0.15.0_linux_arm64.tar.gz"
      sha256 "2492a85938352294c6f68530efcde33799d60ff2a400eddd9b018bd87eef8375"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.15.0/clab_v0.15.0_linux_amd64.tar.gz"
      sha256 "f83753aa23a3552c1adc6fa377e8086d2f593b279528b5fe934633acdf671b35"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.15.0", shell_output("#{bin}/clab version")
  end
end
