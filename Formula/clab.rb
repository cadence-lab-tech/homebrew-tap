# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  version "0.5.1"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.5.1/clab_v0.5.1_darwin_arm64.tar.gz"
      sha256 "7c2ecbab431607c3b8584729e3be522de04ba253a66db21f963bc181b750e1f1"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.5.1/clab_v0.5.1_darwin_amd64.tar.gz"
      sha256 "848e76cb4da69f9e2d6e8f02769a89d5542c73c3a02e02e6d599f7d10783f505"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.5.1/clab_v0.5.1_linux_arm64.tar.gz"
      sha256 "98ce5ca3d79c9fb4f880879e0fe1075475dd396172c820a95038e8ee18ac9998"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.5.1/clab_v0.5.1_linux_amd64.tar.gz"
      sha256 "97d1ab214b8847526984eec9164f8f03d7edd7c1c66f7cfbe873416961d394fe"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.5.1", shell_output("#{bin}/clab version")
  end
end
