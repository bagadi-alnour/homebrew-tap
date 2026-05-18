class Todo < Formula
  desc "Project-embedded interactive todo system for developers"
  homepage "https://github.com/bagadi-alnour/todo-cli"
  url "https://github.com/bagadi-alnour/todo-cli/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "83af29b82958d233357fbb9b7c9f69cb8744c8be065d0953b657017e71cbf009"
  license "MIT"
  head "https://github.com/bagadi-alnour/todo-cli.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/bagadi-alnour/todo-cli/internal/cmd.Version=#{version}
      -X github.com/bagadi-alnour/todo-cli/internal/cmd.BuildDate=#{time.iso8601}
      -X github.com/bagadi-alnour/todo-cli/internal/cmd.Commit=v#{version}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/todo"
  end

  test do
    assert_match "Project-embedded interactive todo system", shell_output("#{bin}/todo --help")
    assert_match "todo next", shell_output("#{bin}/todo --help")
    assert_match "default port 17887", shell_output("#{bin}/todo ui --help")
    # Test init command
    system bin/"todo", "init"
    assert_path_exists testpath/".todos/users"
    assert_path_exists testpath/".todos/config.json"
  end
end
