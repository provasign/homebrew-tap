# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.8"
  license "Apache-2.0"

  depends_on "z3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.8/stele-v0.1.8-darwin-amd64"
      sha256 "9e9ed3fec85f1414db2620e3628887d2edeb68791eeac1aefa4700170da40e15"

      define_method(:install) do
        bin.install "stele-v0.1.8-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.8/stele-v0.1.8-darwin-arm64"
      sha256 "f3cf72c39c7c9d452ed527134cd9e7f650e87febc3e45cf771397cd15c4eb90e"

      define_method(:install) do
        bin.install "stele-v0.1.8-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.8/stele-v0.1.8-linux-amd64"
      sha256 "504965ba05c1819f399653e660e222008584ac7c97277a92b40522f165926b02"

      define_method(:install) do
        bin.install "stele-v0.1.8-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.8/stele-v0.1.8-linux-arm64"
      sha256 "231b9c31853f51d00a4ee4359166370a7d9b4fdc40b0c814876dd55501be7c76"

      define_method(:install) do
        bin.install "stele-v0.1.8-linux-arm64" => "stele"
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
