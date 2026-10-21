# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.12.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.12.0/clab_v0.12.0_darwin_arm64.tar.gz"
      sha256 "06964c9480492370455ea76b4c22b39c01d42c4289fdb4de2d933a74d3469c1a"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.12.0/clab_v0.12.0_darwin_amd64.tar.gz"
      sha256 "0e9047e659e3525eab4179a50f9633dce138534417db79c7874520271bcd0ace"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.12.0/clab_v0.12.0_linux_arm64.tar.gz"
      sha256 "5a713244f03675c36dabf89eefb78704133594338e6ef7d83ac9bd3f03d2d0ab"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.12.0/clab_v0.12.0_linux_amd64.tar.gz"
      sha256 "23a83497b9cc4f60eb0efea5f466e7965d68f46e298ac9578474ef018350a55f"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.12.0", shell_output("#{bin}/clab version")
  end
end
