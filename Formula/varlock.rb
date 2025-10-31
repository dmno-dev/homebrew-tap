
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.1.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "c202abbd7263e20bbe65d07ec75c732763e5d11c8424a6966e59745b7f7a7217"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "d0d023df05c945a977b9c97a88c4a2588d1bb3abe773c45cf33b735f7214bde5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "3d293c4e24d34f6b396107b8b61330d243a36ece42297e6057941fefc55632f3"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "722f905aa8e97ecb9151ef7daa032ba2056d64e055b166e8f1427ee062bc9a39"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.1.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
