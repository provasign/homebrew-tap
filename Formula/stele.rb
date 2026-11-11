# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.14"
  license "Apache-2.0"

  depends_on "z3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.14/stele-v0.1.14-darwin-amd64"
      sha256 "8e961784f03ac1acaefcbb44ec97fa6a5749bdceab740d62173a51647b5c943e"

      define_method(:install) do
        bin.install "stele-v0.1.14-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.14/stele-v0.1.14-darwin-arm64"
      sha256 "cff4654dbbd1e6d55b0800fc48d1890ac3a3cf7d914b8c9fb066da499a0539e9"

      define_method(:install) do
        bin.install "stele-v0.1.14-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.14/stele-v0.1.14-linux-amd64"
      sha256 "de497ad9cc1fadd740ec7ce00038a9ae47dca6d83fddd7f3c8f8d3f5d8361d4c"

      define_method(:install) do
        bin.install "stele-v0.1.14-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.14/stele-v0.1.14-linux-arm64"
      sha256 "200ded3099737b70574dd02c03fb80f8bb267717d3f9208adb789c9c977a7038"

      define_method(:install) do
        bin.install "stele-v0.1.14-linux-arm64" => "stele"
      end
    end
  end

  def caveats
    <<~EOS
      Stele: requirements that hold. It checks each new request or spec change
      against every approved requirement, and asks you about any contradiction
      before code is written.

      Next steps:
        1. cd your-repo
        2. stele init       finds your specs (or the requests your agents declare
                            with Shale) and your coding agents; writes their
                            instructions and hooks, and a git pre-commit hook
        3. Commit what it writes
        4. Open your coding agent and work as usual
    EOS
  end

  test do
    assert_match "stele", shell_output("#{bin}/stele version")
  end
end
