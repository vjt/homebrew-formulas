class RustVcprompt < Formula
  desc "Informative version control prompt for your shell"
  homepage "https://github.com/sscherfke/rust-vcprompt"
  url "https://github.com/sscherfke/rust-vcprompt/archive/0.1.0.tar.gz"
  sha256 "3c51261c7b75f04de566d97a95530521f71fb8b99529deab5ce8af97702c7acf"
  head "https://github.com/sscherfke/rust-vcprompt.git"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    system "mv", "target/release/vcprompt", "target/release/rust-vcprompt"
    bin.install "target/release/rust-vcprompt"
  end

  test do
    system "cargo", "test"
  end
end
