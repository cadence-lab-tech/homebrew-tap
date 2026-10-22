# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.14.1"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.14.1/clab_v0.14.1_darwin_arm64.tar.gz"
      sha256 "4de9939b809b09cf3481206d60797b1cce78b7fa2bc2f7703fbfacefffc0d0cd"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.14.1/clab_v0.14.1_darwin_amd64.tar.gz"
      sha256 "835029a343ca025e4c00f7c439d03cffdd5304d54240bfc33883a2d30cab58bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.14.1/clab_v0.14.1_linux_arm64.tar.gz"
      sha256 "5989ef8376af3ddafd185fb44c2e88630c170709ce1445af42982c1b2d78ecab"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.14.1/clab_v0.14.1_linux_amd64.tar.gz"
      sha256 "eea65bcbeb722f07025973852375da1d18a802bb7e42b2cb6d9e0b824ee95eb8"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.14.1", shell_output("#{bin}/clab version")
  end
end
