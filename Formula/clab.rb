# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.20.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.20.0/clab_v0.20.0_darwin_arm64.tar.gz"
      sha256 "245607913f817f76193e8b6fd567a2aa0c9d24f09156f6df0d3d68917642fff1"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.20.0/clab_v0.20.0_darwin_amd64.tar.gz"
      sha256 "7bbf5fa81f3eb447bb943ac1784a6066ef24d261faadfc96286b91834c765947"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.20.0/clab_v0.20.0_linux_arm64.tar.gz"
      sha256 "63394ab5e5839483e826a5a4dc07533e234d7858eec09033f4fe0afdbdd86e44"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.20.0/clab_v0.20.0_linux_amd64.tar.gz"
      sha256 "27dbf3a532bfaa2a9b502d4e00a2ae014bffeccc2b8a05f4c84961b935b8b8ed"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.20.0", shell_output("#{bin}/clab version")
  end
end
