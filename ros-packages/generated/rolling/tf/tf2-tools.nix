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
  version = "0.39.3-1";
  src = finalAttrs.passthru.sources."tf2_tools";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ rclpy tf2-msgs tf2-py tf2-ros-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "graphviz" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "tf2_tools" = substituteSource {
        src = fetchgit {
          name = "tf2_tools-source";
          url = "https://github.com/ros2-gbp/geometry2-release.git";
          rev = "c22290a77e8a226c74757c5374c8f72ef1162f69";
          hash = "sha256-qpAHozlg40ehN+YV+ho2/i0t0lVcy6TSQSc4xw52+EU=";
        };
      };
    });
  };
  meta = {
    description = "tf2_tools";
  };
})
