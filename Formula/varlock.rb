
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.7.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "02421f71a76888223a0535da1a6863c68d89c844f5ed4903b3943c5fa26ba702"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "5114d2e5852d313aa102cf341ffec1c30fafb725a6a7b4f8cf493bae4b262338"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "bff75960d6f5ae3713ca4970bc12c82e0497a279db2a3be99a69d8fb82e876d6"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "ee3eefdb55524456b7b1ac497ee476cf1afb4aa524f2e6fd0f6dcc04deedc00a"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.7.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
