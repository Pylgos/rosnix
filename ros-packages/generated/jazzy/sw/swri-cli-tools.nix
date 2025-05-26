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
  version = "3.7.6-1";
  src = finalAttrs.passthru.sources."swri_cli_tools";
  propagatedNativeBuildInputs = [ marti-introspection-msgs rcl-interfaces rclpy ros2cli ros2node ros2param ros2topic ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-natsort" ]; };
  propagatedBuildInputs = [ marti-introspection-msgs rcl-interfaces rclpy ros2cli ros2node ros2param ros2topic ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-natsort" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "swri_cli_tools" = substituteSource {
      src = fetchgit {
        name = "swri_cli_tools-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "07c5f9c16bf8c6e585c3f23b2b1aae35745ad44c";
        hash = "sha256-2QdKx8IuGuYO0/k9h32kQz9jNi7/egpMkCCgdxZgac8=";
      };
    };
  });
  meta = {
    description = "Command line tools for introspecting ROS systems";
  };
})
