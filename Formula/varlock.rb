
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.20.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "44dbc0b19d95a92912b4125cf31d0b28171d9c8b9aebe1b42bfce7e141a98112"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "8a56df2b69d2d7def6b83b42e7f2287149d076b8854703b46c3e659ad28128a3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "a61e72cbf75d6269743771b14f061982957a15474bd3a117f27d8d818e3eaa99"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "6ed6fb0d356d4576a5a606861fa5871f1aac67a08e9300c0b1b486b55258b7c3"
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
    assert_equal "1.20.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
