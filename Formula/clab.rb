# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  license "FSL-1.1-ALv2"
  version "0.25.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.25.0/clab_v0.25.0_darwin_arm64.tar.gz"
      sha256 "95b7981354dcc3333faa71112ba3d4cc1dee9c9135254fea1bdce4f858a13b7f"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.25.0/clab_v0.25.0_darwin_amd64.tar.gz"
      sha256 "bbfe49f4501b059291e1215c517a05bb55f576514450c3501d79766898fbdb2f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.25.0/clab_v0.25.0_linux_arm64.tar.gz"
      sha256 "fe585a8928b5f286b9e41041ddad2802dc19272465b779837f0e25fd2d7ba541"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.25.0/clab_v0.25.0_linux_amd64.tar.gz"
      sha256 "f6f7092f8029bd40c5264dd62a653355af570b54674f950ad18b55c0c1345eed"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.25.0", shell_output("#{bin}/clab version")
  end
end
