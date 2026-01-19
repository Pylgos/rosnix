{
  ament-cmake-pytest,
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  easynav-interfaces,
  easynav-support-py,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclpy,
  ros2cli,
  rosSystemPackages,
  rosidl-runtime-py,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "easynav_tools";
  version = "0.3.2-1";
  src = finalAttrs.passthru.sources."easynav_tools";
  propagatedNativeBuildInputs = [ easynav-interfaces easynav-support-py geometry-msgs rclpy ros2cli rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-platformdirs" "python3-rich" "python3-typing-extensions" ]; };
  propagatedBuildInputs = [ easynav-interfaces easynav-support-py geometry-msgs rclpy ros2cli rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-platformdirs" "python3-rich" "python3-typing-extensions" ]; };
  checkInputs = [ ament-cmake-pytest ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "easynav_tools" = substituteSource {
      src = fetchgit {
        name = "easynav_tools-source";
        url = "https://github.com/EasyNavigation/EasyNavigation-release.git";
        rev = "abbbf2ea015e3bd15ec592c5848cc972acb5350b";
        hash = "sha256-VwEoji2v568jckJ/RlVxFLpSlVAsgilfEoqnGt5Od0Y=";
      };
    };
  });
  meta = {
    description = "ROS 2 Navigation tools: TUI + ros2cli commands for EasyNav.";
  };
})
