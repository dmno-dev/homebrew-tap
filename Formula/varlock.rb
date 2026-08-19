
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.17.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "6b64904fee339f1244d666726784e71133f930f7eb9cbc8ebbaea43d200f00f3"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "7cbc0e213ff0ec9ca4da775c3b03e6cbbf9f1b7158de324d07211ca386a2ca6a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "9b0ee1a7d42469c27dbfa284fa4337eb02c39c259198f36c5b127d5c3fb7a89d"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "08ea40fdca2ffeb7bb0afe6f47813bab43298c1ce897f07e013aae2649bfc01a"
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
    assert_equal "1.17.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
