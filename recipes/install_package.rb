package "keepalived" do
  action :upgrade if node["keepalived"]["upgrade"]
end