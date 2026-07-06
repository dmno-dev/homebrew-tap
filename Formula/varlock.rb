
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.10.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "1f65006a6d8b6c34d8a3f1bb919b6d7426cff7e6d01b6ac429f970c6711eeef4"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "ac2ffac522d591faa85b7a6a4f74840402276455c9ad9054f16a0333f8031c33"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "addd457996429235e6e5e8993d897aee21bc73c6781b9b8db4992e93b3837c4a"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "c77fbf0ec8151267e91646c5fdd6c5698ca5d987c0cfd49f8f047fcaac1fa3e2"
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
    assert_equal "1.10.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
