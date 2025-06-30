{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  ros2cli,
  ros2launch,
  rosSystemPackages,
  substituteSource,
  turtlesim,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "insight_gui";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."insight_gui";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rclpy ros2cli ros2launch turtlesim ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "adwaita-icon-theme" "gtk4" "libadwaita-dev" "libgirepository-dev" "libglib-dev" "python3-gi" "python3-gi-cairo" "python3-networkx" "python3-pygraphviz" ]; };
  propagatedBuildInputs = [ rclpy ros2cli ros2launch turtlesim ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "adwaita-icon-theme" "gtk4" "libadwaita-dev" "libgirepository-dev" "libglib-dev" "python3-gi" "python3-gi-cairo" "python3-networkx" "python3-pygraphviz" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "insight_gui" = substituteSource {
      src = fetchgit {
        name = "insight_gui-source";
        url = "https://github.com/ros2-gbp/insight_gui-release.git";
        rev = "e2c7266da491abb4a1ecd359f72cbea7f6d062a7";
        hash = "sha256-eJSqyDi5tZ9eIPjec/WnOZkeMGGO6WN2kwwsfJ09BfM=";
      };
    };
  });
  meta = {
    description = "Insight is a minimalist GUI alternative to rqt. It is a GTK4-based tool for exploring ROS2 topics, services, and messages, featuring the GNOME Adwaita style.";
  };
})
