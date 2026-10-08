# typed: false
# frozen_string_literal: true

# Формулу пишет bin/formula.sh по событию из релиза sdlc-pipeline-backend;
# править руками бессмысленно — следующий релиз перезапишет.

class Clab < Formula
  desc "Cadence Lab: задачи, гейты и MCP из терминала"
  homepage "https://github.com/cadence-lab-tech/homebrew-tap"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.5.0/clab_v0.5.0_darwin_arm64.tar.gz"
      sha256 "d938769c0cce4c0a9e6fcde15ccf2dc42ce73604355f38a16c1fb9dcd3880dff"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.5.0/clab_v0.5.0_darwin_amd64.tar.gz"
      sha256 "2532b2f09af8de39dc68ce5eb52e5f796076b5aeb98a15baff8c76af572070a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.5.0/clab_v0.5.0_linux_arm64.tar.gz"
      sha256 "f062c5d47cc060f050290168ffd832a74561b7a6bc5894a16e199924d6e10e3f"
    end
    on_intel do
      url "https://github.com/cadence-lab-tech/homebrew-tap/releases/download/v0.5.0/clab_v0.5.0_linux_amd64.tar.gz"
      sha256 "6b867458995d05cc6c8b9ae4718ea526bb45db3e481fc069bed68ac81d9b7d81"
    end
  end

  def install
    bin.install "clab", "clab-runner"
  end

  test do
    assert_match "clab v0.5.0", shell_output("#{bin}/clab version")
  end
end
