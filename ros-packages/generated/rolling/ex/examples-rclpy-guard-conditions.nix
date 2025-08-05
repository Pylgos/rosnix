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
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "examples_rclpy_guard_conditions";
  version = "0.21.2-1";
  src = finalAttrs.passthru.sources."examples_rclpy_guard_conditions";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_guard_conditions" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_guard_conditions-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "aaffa1a0bab0cfc960068b970ad9b3c882459c6a";
        hash = "sha256-lhfJ0Q5DucWPBwDs6wmLJbszR3gQH0TpLi3InCLTseg=";
      };
    };
  });
  meta = {
    description = "Examples of using guard conditions.";
  };
})
