# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.7.1"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.7.1/clab_v0.7.1_darwin_arm64.tar.gz"
      sha256 "b0e707f72aebf10331628334211d5c41f71ed7b5bca74428a0a73f16454eb33f"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.7.1/clab_v0.7.1_darwin_amd64.tar.gz"
      sha256 "a7c22d0e8688dbd59fc3fb4b16c74b3c059312c01f403ae0b14ed71c2f4e6597"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.7.1/clab_v0.7.1_linux_arm64.tar.gz"
      sha256 "f55257adcc0b3eafd273d5f8d714612d5bf892df8f3eb80b5ced5150f23415b3"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.7.1/clab_v0.7.1_linux_amd64.tar.gz"
      sha256 "0e117a28474631785ad40d78642736f74e5465a6466689f0333cbbc90e6a1112"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.7.1", shell_output("#{bin}/clab version")
  end
end
