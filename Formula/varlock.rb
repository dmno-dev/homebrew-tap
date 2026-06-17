
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.7.1"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "d726408c420db0063e43258d83caf58fa4db5c2532c2d32cff14984cf3404986"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "1555d51cde85bf60438dcea4ab0e0b1ea4cda7d8cc1083411fb51d1e5c75e7de"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "d85f24c628e22d1ad9304ed3c584f5b6cf115d4b64ec62f2e860507b11044c42"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "8284c08378b164ecbdd9e33590e9a6831ca9097ef7408be79ee825fef183d301"
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
    assert_equal "1.7.1", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
