
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.17.1"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "96f18cae5224ff99edd23c0c1f4c7822f77e419e88d01c8ab4a016d3501cdb42"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "534241d70aef45563131e39c3272f557165ac5bc45db8f0e23c84f49f4eee2f1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "6d30e3963da30e4debde453eebeddcdc823ef8eea0744ec9c3a22574cfcaa0d0"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "714b142a027490b9776c65c3519d991d31fa4632f6fb468ffe19f334e999ac3e"
    end
  end

  def install
    bin.install "varlock"

    on_macos do
      libexec.install "VarlockEnclave.app"
    end

    on_linux do
      libexec.install "varlock-local-encrypt"
    end
  end

  test do
    assert_equal "1.17.1", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
