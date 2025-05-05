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
  version = "0.13.3-1";
  src = finalAttrs.passthru.sources."sros2";
  propagatedNativeBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-argcomplete" "python3-importlib-resources" ]; };
  propagatedBuildInputs = [ ament-index-python ros2cli ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-cryptography" "python3-lxml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ros-testing test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sros2" = substituteSource {
      src = fetchgit {
        name = "sros2-source";
        url = "https://github.com/ros2-gbp/sros2-release.git";
        rev = "14e33543d51b2667e2ab47834ed82da187e80d3e";
        hash = "sha256-pDfAJwbP05BhhZMZ08ubKPIpKM0myfyUUmJQeo61jjQ=";
      };
    };
  });
  meta = {
    description = "Command line tools for managing SROS2 keys";
  };
})
