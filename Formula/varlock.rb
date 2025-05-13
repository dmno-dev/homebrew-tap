
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  version "x.x.x"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "285733195d5bb2fdcb8d3127d1afbeb4b5dda8d6687555d89a06724f9ed3dfaa"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "9450468a772a6d66d2e924b1abaf8844e8850add7454e2d4db7689cf34a4648d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "5bd5aaa32d5d8261526233f0c79b383b7be6912f262d01549cf9165055d9335a"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "686f7f6961a7d81e5e63a7656bc0600525822d5951d00daea5ad2e58c07ef25c"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    system bin/"varlock", "--version"
  end
end
