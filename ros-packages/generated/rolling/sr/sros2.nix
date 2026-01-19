{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-mypy,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  ros-testing,
  ros2cli,
  rosSystemPackages,
  substituteSource,
  test-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "sros2";
  version = "0.16.3-1";
  src = finalAttrs.passthru.sources."sros2";
  propagatedNativeBuildInputs = [ ament-index-python rclpy ros2cli ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-argcomplete" "python3-cryptography" "python3-lxml" ]; };
  propagatedBuildInputs = [ ament-index-python rclpy ros2cli ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-argcomplete" "python3-cryptography" "python3-lxml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ros-testing test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sros2" = substituteSource {
      src = fetchgit {
        name = "sros2-source";
        url = "https://github.com/ros2-gbp/sros2-release.git";
        rev = "b03079764c7d701262cd6c05ea21e16ada77a64f";
        hash = "sha256-uAVLVp700iAawWDYdzg34uhWAlHLzvNasEOLu5ungFY=";
      };
    };
  });
  meta = {
    description = "Command line tools for managing SROS2 keys";
  };
})
