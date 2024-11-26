{
  ament-lint-auto,
  ament-lint-common,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle,
  lifecycle-msgs,
  mkSourceSet,
  rclpy,
  ros-testing,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "lifecycle_py";
  version = "0.33.5-1";
  src = finalAttrs.passthru.sources."lifecycle_py";
  propagatedBuildInputs = [ lifecycle-msgs rclpy std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common lifecycle ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "lifecycle_py" = substituteSource {
      src = fetchgit {
        name = "lifecycle_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "400cb7ad9a3550e4a056bfe1a7249ab03f523820";
        hash = "sha256-FA7CdkffuOXf58i2saMPuSv0VnVWFjNN5xkHSiEvrNM=";
      };
    };
  });
  meta = {
    description = "Package containing demos for rclpy lifecycle implementation";
  };
})
