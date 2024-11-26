{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl-interfaces,
  rclpy,
  ros2action,
  ros2cli,
  ros2node,
  ros2param,
  ros2topic,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "system_fingerprint";
  version = "0.7.0-3";
  src = finalAttrs.passthru.sources."system_fingerprint";
  propagatedBuildInputs = [ rcl-interfaces rclpy ros2action ros2cli ros2node ros2param ros2topic ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-git" ]; };
  passthru.sources = mkSourceSet (sources: {
    "system_fingerprint" = substituteSource {
      src = fetchgit {
        name = "system_fingerprint-source";
        url = "https://github.com/ros2-gbp/ros_system_fingerprint-release.git";
        rev = "0ee0c1f74f519caf695ef608418dcccf163a7412";
        hash = "sha256-swG8fwjiFc0LXSlbA6Lml0jlh/VyNS//insRqM01fr0=";
      };
    };
  });
  meta = {
    description = "The system_fingerprint package";
  };
})
