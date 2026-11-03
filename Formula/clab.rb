# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.22.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.22.0/clab_v0.22.0_darwin_arm64.tar.gz"
      sha256 "4793e323ad960778a1df2e04577014e7aa4d7a0914852abf969058412f0d172b"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.22.0/clab_v0.22.0_darwin_amd64.tar.gz"
      sha256 "00e6b4a65e9db2380bd11b6e467180fdab45b68da5f5c3ff114736efd9c75009"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.22.0/clab_v0.22.0_linux_arm64.tar.gz"
      sha256 "824a760dc9a3b426405903599f69485687055f5599325defb5c7abe13c1c1311"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.22.0/clab_v0.22.0_linux_amd64.tar.gz"
      sha256 "dc35b9aaf3891b3ddbe623fa8c512abd154755cc47d2c923ab632dcba8eabfb3"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.22.0", shell_output("#{bin}/clab version")
  end
end
