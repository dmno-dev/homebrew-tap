
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.21.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "50579551423c4b54f3bf8fd700fe20ac2ebeca5c6a6d9e3e2ac4fac6d9e97044"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "b84c703ae31bddcd0ddec5eec1d2189165d980b9a10bde7a7fc6e2353ae76445"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "828c052895c226630d451fd1a663361a86cab60ac0ba35394a26cd9a94331b99"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "16f1773b769f4da6e27a0610c2cc6686a2dfb1eaff17c4e952a968831cb298da"
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
    assert_equal "1.21.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
