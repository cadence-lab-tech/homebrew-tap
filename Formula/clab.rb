# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.27.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.27.0/clab_v0.27.0_darwin_arm64.tar.gz"
      sha256 "b3ce6afe562370319c4673acd9c01d3dd5ebef033994fb5431c6c62f51e623e5"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.27.0/clab_v0.27.0_darwin_amd64.tar.gz"
      sha256 "b4e0daf9f9f0f6831ccb6dcde525cb4abcd9cab66b85b398efbbccfc1cb1eabf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.27.0/clab_v0.27.0_linux_arm64.tar.gz"
      sha256 "b569b43e5bd1cd69cee45a94f70362f36fc790590328cb47f8d29ccce602213d"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.27.0/clab_v0.27.0_linux_amd64.tar.gz"
      sha256 "7870300f104b9183ff050ea8e0798b2c4c589db02fe394c95ec073684238bd92"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.27.0", shell_output("#{bin}/clab version")
  end
end
