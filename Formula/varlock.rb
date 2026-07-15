
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.11.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "7056249538260d76e26b5faca13548cb97cae739a42a0f08562a21a249fddf60"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "a0adde5c5febaa73d1e2dd2eaed2522f9274523ca6def7a554ac3d12abf584c1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "bf1caf12348a05e0ba5eabfdf5b9b9ef7d976e09d31ccc3b51f4b27eb1ce63ec"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "5b74a89f07ac27ee21e819e5b2aa327792bb3e5676338e62b8ef2f9a120b45bd"
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
    assert_equal "1.11.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
