# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.8.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.8.0/clab_v0.8.0_darwin_arm64.tar.gz"
      sha256 "d527a4a439f9308abf135508b4bbac750106313c703bdacaf00a1096290953a4"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.8.0/clab_v0.8.0_darwin_amd64.tar.gz"
      sha256 "9ec5f0125dd62eb457b3ca6e0fd53dff0c56e470f6966e7b177e1f619f400f93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.8.0/clab_v0.8.0_linux_arm64.tar.gz"
      sha256 "643edce25aacb5e2fb280473c0271a6e49d88ad1f247fb675ce06b2a8937f1fd"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.8.0/clab_v0.8.0_linux_amd64.tar.gz"
      sha256 "833ee357e92956dccf71a5c41b123892f60c3e38faeda450ff58fb544683b35c"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.8.0", shell_output("#{bin}/clab version")
  end
end
