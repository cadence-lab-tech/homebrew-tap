# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.19.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.19.0/clab_v0.19.0_darwin_arm64.tar.gz"
      sha256 "b0cebba82e9efc03269f4fd65e2e3897ae06c0b59e92c7d4203d8f771ccdf4f9"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.19.0/clab_v0.19.0_darwin_amd64.tar.gz"
      sha256 "a23b29ad92696e51d99d29c76e9a3682ab186d56d6b231009aa0a4843b4353a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.19.0/clab_v0.19.0_linux_arm64.tar.gz"
      sha256 "c4ef553eacd3391d43662525d7ef9555b021454117e37a993f13ff5805be4b9a"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.19.0/clab_v0.19.0_linux_amd64.tar.gz"
      sha256 "ac58596216f2165f2ca9be28e735fe4a8012f32781ae8a3bd4b0d03ac568534d"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.19.0", shell_output("#{bin}/clab version")
  end
end
