
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  version "x.x.x"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-#{version}-macos-x64.tar.gz"
      sha256 "b9799f7ec5ad8f26f9af461ac04368bfb18c318c6a752f6e84e61fed8fa37738"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-#{version}-macos-arm64.tar.gz"
      sha256 "345ae135c65e48d96c2f3884ab5469b38c506175d37f1ea39ede8a2837f43419"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-#{version}-linux-x64.tar.gz"
      sha256 "e54ec26d8a24a6393cbaa866faaeaac9527f4b389c8b354f5eb179b64f004400"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-#{version}-linux-arm64.tar.gz"
      sha256 "0047c473bd31fb7050743ca811e060f2ac82e85a6d3d3c42548c1561a6dc111e"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    system bin/"varlock", "--version"
  end
end
