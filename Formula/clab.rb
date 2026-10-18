# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.6.1"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.6.1/clab_v0.6.1_darwin_arm64.tar.gz"
      sha256 "9e242bd194ed011e3958ecf3d509844d211f8711f9c5f4a2d2a12a8fb8c62089"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.6.1/clab_v0.6.1_darwin_amd64.tar.gz"
      sha256 "579d4e39cf10014076e3f2bc255d6ed3429334f132b9821922be10917ac20591"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.6.1/clab_v0.6.1_linux_arm64.tar.gz"
      sha256 "40c21afc57a05c15ccb4ed36c2fdc1159d91509bd7ec26fae00cc054511a6fcc"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.6.1/clab_v0.6.1_linux_amd64.tar.gz"
      sha256 "97a790146a3dd05fa933f28e798655ae8e77ab9566d3d29391cfab56d4d996bf"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.6.1", shell_output("#{bin}/clab version")
  end
end
