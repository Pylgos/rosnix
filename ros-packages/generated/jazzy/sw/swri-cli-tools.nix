{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  marti-introspection-msgs,
  mkSourceSet,
  rcl-interfaces,
  rclpy,
  ros2cli,
  ros2node,
  ros2param,
  ros2topic,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "swri_cli_tools";
  version = "3.8.1-1";
  src = finalAttrs.passthru.sources."swri_cli_tools";
  propagatedNativeBuildInputs = [ marti-introspection-msgs rcl-interfaces rclpy ros2cli ros2node ros2param ros2topic ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-natsort" ]; };
  propagatedBuildInputs = [ marti-introspection-msgs rcl-interfaces rclpy ros2cli ros2node ros2param ros2topic ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-natsort" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "swri_cli_tools" = substituteSource {
      src = fetchgit {
        name = "swri_cli_tools-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "90e7315ddaf18b6b1466f441757da4a62872dde0";
        hash = "sha256-faQ0YlowHa/ntCO+/OxqVqkfq8ZCqsA1okxL4L1UuvY=";
      };
    };
  });
  meta = {
    description = "Command line tools for introspecting ROS systems";
  };
})
