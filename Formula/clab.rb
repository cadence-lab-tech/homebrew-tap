# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.8.1"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.8.1/clab_v0.8.1_darwin_arm64.tar.gz"
      sha256 "e8dfecf78e9242fea6a9bfeabd9455fcdd8c20a76b6f376fa8b7b9198f5bba56"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.8.1/clab_v0.8.1_darwin_amd64.tar.gz"
      sha256 "f4b51c2ce50da202b6859357c77bc0719d895f1750554631daeaa96dae7195b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.8.1/clab_v0.8.1_linux_arm64.tar.gz"
      sha256 "de451b9f4e19c56811536691fd12e49791bec9e0ef9b59961a0976f89b13a6a7"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.8.1/clab_v0.8.1_linux_amd64.tar.gz"
      sha256 "3837c469ccaa74232a76ac1f0bd355a44ea68cb9755b3e9995745a8b0ac9c6a1"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.8.1", shell_output("#{bin}/clab version")
  end
end
