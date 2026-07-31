
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.16.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "b5255180ab4988ee8332d55077f7cf40104c67a520905cfaedbb743b3bbfb20a"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "47a8c97e2059a4469b81fb3a872289eaa52315dadfa0a399f6aae0d1d5ed2624"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "80b21d2b50eedb5f77607edfb999dd1cb4c284f05a9d6c78df205b380a5968b8"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "f5323e4526b1a1f853121f3d8c2674757a1640b23a237d2dcd9c629212bede90"
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
    assert_equal "1.16.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
