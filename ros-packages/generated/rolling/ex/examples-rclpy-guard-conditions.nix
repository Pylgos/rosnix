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
  version = "0.21.4-1";
  src = finalAttrs.passthru.sources."examples_rclpy_guard_conditions";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_rclpy_guard_conditions" = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_guard_conditions-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "7e0ef8f7b9d3377e217f66aadf009db82ce0cb57";
        hash = "sha256-zVmo/b5VAIu44v12jDe1X4orCbXGQvzUbJjtyJl4yjc=";
      };
    };
  });
  meta = {
    description = "Examples of using guard conditions.";
  };
})
