# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.11.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.11.0/clab_v0.11.0_darwin_arm64.tar.gz"
      sha256 "946647522428277f9427cc2b2f631a1298ef470814b011a68493d49e2ec63eea"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.11.0/clab_v0.11.0_darwin_amd64.tar.gz"
      sha256 "2f7dce2b4ba8befdf71624887baca2a9a4cc612a534f847a9c2714016ff74016"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.11.0/clab_v0.11.0_linux_arm64.tar.gz"
      sha256 "8c3219327a43190fe7f10df5bce65a973a15d21edf73f45eeebfc7daf5000a6f"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.11.0/clab_v0.11.0_linux_amd64.tar.gz"
      sha256 "75708f6e4b5f9d87069c454aeda37a4bbfd836273152994870fdbb71f7f09037"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.11.0", shell_output("#{bin}/clab version")
  end
end
