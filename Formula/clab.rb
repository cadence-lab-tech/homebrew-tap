# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.14.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.14.0/clab_v0.14.0_darwin_arm64.tar.gz"
      sha256 "dfbb0dc1431bd593174f5881ccf735020cc0afa3d9f4d19e0692aa2be7efc37d"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.14.0/clab_v0.14.0_darwin_amd64.tar.gz"
      sha256 "ddbf2f6bfa8446b3d183400790e319720cdfa727ea360aacaca48be6fb25e323"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.14.0/clab_v0.14.0_linux_arm64.tar.gz"
      sha256 "826eab0a9688d1129961297da0ea77ae6e3acaf9c70680d19c419da47cef8710"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.14.0/clab_v0.14.0_linux_amd64.tar.gz"
      sha256 "6af6c02197f0d67423541867f7bb11b0373c9c565d064a815f2da535bebd7d1e"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.14.0", shell_output("#{bin}/clab version")
  end
end
