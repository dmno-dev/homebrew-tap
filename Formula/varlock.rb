
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.21.1"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "5b161be4d6d6532c20f2810ba433b99f60f10c5b7325675961ca586bd08c3c67"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "9fb3779c658d77e0e68265f6a28b8350fca0add9c3c719e7970ea9a2ecc4b1b7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "3920b4696e1922287402113dad73a31b7dea94973ccbba8f2628020a20d2243a"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "01dfd04aa833c445e1f11d7206f80b4ef5f7793161abcd1cc5b76e3b9346225c"
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
    assert_equal "1.21.1", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
