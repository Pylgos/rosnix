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
  version = "3.8.9-1";
  src = finalAttrs.passthru.sources."swri_cli_tools";
  propagatedNativeBuildInputs = [ marti-introspection-msgs rcl-interfaces rclpy ros2cli ros2node ros2param ros2topic ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-natsort" ]; };
  propagatedBuildInputs = [ marti-introspection-msgs rcl-interfaces rclpy ros2cli ros2node ros2param ros2topic ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-natsort" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "swri_cli_tools" = substituteSource {
      src = fetchgit {
        name = "swri_cli_tools-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "b15687e46a65aad21356f7a683b730a119c7d48f";
        hash = "sha256-oZKuuiqMJShea842Z9wEh+PzcET3zJvL70fvOXiMm3Y=";
      };
    };
  });
  meta = {
    description = "Command line tools for introspecting ROS systems";
  };
})
