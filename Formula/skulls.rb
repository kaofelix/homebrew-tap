class Skulls < Formula
  desc "Dead simple skills installer"
  homepage "https://github.com/kaofelix/skulls"
  url "https://github.com/kaofelix/skulls/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "f923ef3edaa77ecd6b8a7dc5adef6f76e55afa6144acaf111fcc90502477973c"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"skulls"), "./cmd/skulls"
  end

  test do
    output = shell_output("#{bin}/skulls --help")
    assert_match "skulls", output
  end
end
