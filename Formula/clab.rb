# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.16.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.16.0/clab_v0.16.0_darwin_arm64.tar.gz"
      sha256 "42db66611c915ffaf2eacec1a0bc400ef066c7e633bdb32d00f0e27350232253"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.16.0/clab_v0.16.0_darwin_amd64.tar.gz"
      sha256 "da792d87431739a4aca468eccb8e6476d9af9b4ee9678e9a381afc57238f84b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.16.0/clab_v0.16.0_linux_arm64.tar.gz"
      sha256 "0abae12f271ab51c314824cdb4de28055c405c91f1b78898c2b95370ede7eba7"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.16.0/clab_v0.16.0_linux_amd64.tar.gz"
      sha256 "2b08319b5f3f6268ffc28de68086f636a888c9592680b9b12d09a5323bdb6d60"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.16.0", shell_output("#{bin}/clab version")
  end
end
