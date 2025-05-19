{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
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
  version = "0.42.1-1";
  src = finalAttrs.passthru.sources."tf2_tools";
  propagatedNativeBuildInputs = [ rclpy tf2-msgs tf2-py tf2-ros-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "graphviz" "python3-yaml" ]; };
  propagatedBuildInputs = [ rclpy tf2-msgs tf2-py tf2-ros-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "graphviz" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tf2_tools" = substituteSource {
      src = fetchgit {
        name = "tf2_tools-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "6f557aa035c598d02319b703d18dc34ec890264b";
        hash = "sha256-qxsonKur3earQoMDmusqHsvYfs9OkZmXrr7qxVGllYQ=";
      };
    };
  });
  meta = {
    description = "\n    tf2_tools\n  ";
  };
})
