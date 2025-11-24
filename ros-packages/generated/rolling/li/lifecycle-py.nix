{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
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
  version = "0.37.4-1";
  src = finalAttrs.passthru.sources."lifecycle_py";
  propagatedNativeBuildInputs = [ lifecycle-msgs rclpy std-msgs ];
  propagatedBuildInputs = [ lifecycle-msgs rclpy std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint lifecycle ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "lifecycle_py" = substituteSource {
      src = fetchgit {
        name = "lifecycle_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "398107922bdaea1ce414e0c376b9eafd6abd80e2";
        hash = "sha256-abMDkleecK120F/yyuJr7vnhzKy1sIjJUOQ5JY+Pdss=";
      };
    };
  });
  meta = {
    description = "Package containing demos for rclpy lifecycle implementation";
  };
})
