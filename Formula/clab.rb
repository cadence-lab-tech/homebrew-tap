# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.10.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.10.0/clab_v0.10.0_darwin_arm64.tar.gz"
      sha256 "d7cd7f3ab0d065e124552e819f305bef11e87afc92c747571dbc39aca4fb83bb"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.10.0/clab_v0.10.0_darwin_amd64.tar.gz"
      sha256 "605d36a1b9438d46d18fbed06a9aefaec2fd953dd5168c03b8808c0dcfd1d7ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.10.0/clab_v0.10.0_linux_arm64.tar.gz"
      sha256 "c644483b8a44e2f3d68438a978c49bf20f1beed2705c9b97da2001e0258e8e7d"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.10.0/clab_v0.10.0_linux_amd64.tar.gz"
      sha256 "2e668077096fcd9358caada6e5fb31abff8866450a0cdec0c9d2af12e9d56fea"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.10.0", shell_output("#{bin}/clab version")
  end
end
