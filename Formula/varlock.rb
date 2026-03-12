
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.4.1"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "89c04be308eda4751a22f1e11e16d206401446ec66e038714b6546f2458d6c7d"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "1019fed46a06078190c8565f7a78b2bb6c987685832add355240a2b91263b294"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "4958d8da1e8fde587394de332c537f521516f5878819bf5bef94ec8e55dbbff6"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "f110f9b20ef19b4303232f4dc4fab818d83cbc7e15275d409db89e0769c1ff19"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.4.1", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
