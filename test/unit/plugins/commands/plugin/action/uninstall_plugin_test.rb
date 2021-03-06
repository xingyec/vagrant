require File.expand_path("../../../../../base", __FILE__)

describe VagrantPlugins::CommandPlugin::Action::UninstallPlugin do
  let(:app) { lambda { |env| } }
  let(:env) {{
    ui: Vagrant::UI::Silent.new,
  }}

  let(:manager) { double("manager") }

  subject { described_class.new(app, env) }

  before do
    Vagrant::Plugin::Manager.stub(instance: manager)
  end

  it "uninstalls the specified plugin" do
    manager.should_receive(:uninstall_plugin).with("bar").ordered
    app.should_receive(:call).ordered

    env[:plugin_name] = "bar"
    subject.call(env)
  end
end
