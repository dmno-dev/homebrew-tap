
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.0.9"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "f6c5cfdb29f3aeab0b7c34ee618c986a52718e579eb2ff7c3b4c4ea3b4cf23e9"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "bf1ac55907c681d18ddb84150054f0513cd45db54c472679dc5d49d60ef91853"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "f8ecc0e47fabf7a1c67a7dac0797d389404c3fb3fea709ee98e127be77294c1b"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "8c0113e8782f4d0325e202a1e9f68dba4bf56e0bb8d4742ef31a43982900b436"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.0.9", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
