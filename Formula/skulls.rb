class Skulls < Formula
  desc "Dead simple skills installer"
  homepage "https://github.com/kaofelix/skulls"
  url "https://github.com/kaofelix/skulls/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "b70fdcf902e2b52fc7b303519e5216ca5a2e65eaf7db97fd308e61e77657d251"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"skulls"), "./cmd/skulls"
  end

  test do
    output = shell_output("#{bin}/skulls --help")
    assert_match "skulls", output
  end
end
