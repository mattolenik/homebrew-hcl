class Hclq < Formula
  desc 'Small tool for querying and modifying HCL files, similar to jq'
  homepage 'https://github.com/mattolenik/hclq'
  url 'https://github.com/mattolenik/hclq.git', :tag => '0.1.1'

  depends_on 'go'
  depends_on 'dep'

  def install
    mkdir_p buildpath/'src/github.com/mattolenik'
    ln_sf buildpath, buildpath/'src/github.com/mattolenik/hclq'

    ENV['GOPATH'] = buildpath
    system 'make', 'brew'
    bin.install 'dist/hclq'
  end

  test do
    assert_equal 'true', pipe_output("#{bin}/hclq get test", 'test = true')
  end
end
