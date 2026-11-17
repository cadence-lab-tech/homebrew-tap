# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.29.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.29.0/clab_v0.29.0_darwin_arm64.tar.gz"
      sha256 "d83b15f70a93fb93044d800c7d152865374c34d7c102ffdd13f9c23472119183"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.29.0/clab_v0.29.0_darwin_amd64.tar.gz"
      sha256 "a1869ec3f5a7822e009528162776589fee7b6929758a80bf274e4aa4ac37e448"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.29.0/clab_v0.29.0_linux_arm64.tar.gz"
      sha256 "8a0895da7a7f8541380053cdef85dfc57fb81f73547b0d32d7a371e02081e3ec"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.29.0/clab_v0.29.0_linux_amd64.tar.gz"
      sha256 "394754bebe51cb67641683d79620f08663767d50adec2e5887227b5c99a7010a"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.29.0", shell_output("#{bin}/clab version")
  end
end
