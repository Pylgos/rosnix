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
  version = "3.8.5-1";
  src = finalAttrs.passthru.sources."swri_cli_tools";
  propagatedNativeBuildInputs = [ marti-introspection-msgs rcl-interfaces rclpy ros2cli ros2node ros2param ros2topic ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-natsort" ]; };
  propagatedBuildInputs = [ marti-introspection-msgs rcl-interfaces rclpy ros2cli ros2node ros2param ros2topic ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-natsort" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "swri_cli_tools" = substituteSource {
      src = fetchgit {
        name = "swri_cli_tools-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "6faeda4e080af7b9b76a5735362af52033ed2022";
        hash = "sha256-n84Dm+CX0il+Bdj2170r6fRavRiM6kHgedPT+NUYfs8=";
      };
    };
  });
  meta = {
    description = "Command line tools for introspecting ROS systems";
  };
})
