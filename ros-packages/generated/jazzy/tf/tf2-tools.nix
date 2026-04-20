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
  rosSystemPackages,
  substituteSource,
  tf2-msgs,
  tf2-py,
  tf2-ros-py,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "tf2_tools";
  version = "0.36.20-1";
  src = finalAttrs.passthru.sources."tf2_tools";
  propagatedNativeBuildInputs = [ rclpy tf2-msgs tf2-py tf2-ros-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "graphviz" "python3-yaml" ]; };
  propagatedBuildInputs = [ rclpy tf2-msgs tf2-py tf2-ros-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "graphviz" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tf2_tools" = substituteSource {
      src = fetchgit {
        name = "tf2_tools-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "a1bdb54244dc6a6e0d7f5691f3047621a9389a0b";
        hash = "sha256-lpZsh0DjCq/CUPUCYxw2BPwDng0KbTyixdBJ03a6SHs=";
      };
    };
  });
  meta = {
    description = "\n    tf2_tools\n  ";
  };
})
