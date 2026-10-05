# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.4.0/clab_v0.4.0_darwin_arm64.tar.gz"
      sha256 "c8744b675731ad5d56408e7ae0c3eedc0abdef506a6f053ba465d854ad833678"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.4.0/clab_v0.4.0_darwin_amd64.tar.gz"
      sha256 "b4c3712ff499387f45b8850da03e3d9f7918e207fb2690c8293a98186f4ed3a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.4.0/clab_v0.4.0_linux_arm64.tar.gz"
      sha256 "0a6f069138df9951cc217390174116ada6a65b1d1759ca7a2e98e311e29bcac6"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.4.0/clab_v0.4.0_linux_amd64.tar.gz"
      sha256 "ed5857004c41c2a7f577538cf7e5a98622c30439bb962cbb404ba86a0addbd0e"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.4.0", shell_output("#{bin}/clab version")
  end
end
