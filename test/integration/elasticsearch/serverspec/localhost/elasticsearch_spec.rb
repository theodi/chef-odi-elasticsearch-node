require 'spec_helper'

# Make sure elasticsearch is installed
describe package("elasticsearch") do
  it { should be_installed }
end

describe command("dpkg -l elasticsearch") do
  it { should return_stdout /0\.20\.6/ }
end

# Make sure elasticsearch is running
describe service("elasticsearch") do
  it { should be_running }
end

# Make sure we have english dictionaries
describe package("aspell-en") do
  it { should be_installed }
end

describe command("aspell dicts") do
  it { should return_stdout /en/ }
end

# Check elasticsearch memory usage
describe command("ps aux | grep elasticsearch") do
  it { should return_stdout /-Xms376m -Xmx376m/ }
end
