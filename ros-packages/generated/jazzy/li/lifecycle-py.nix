{
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "lifecycle_py" = substituteSource {
      src = fetchgit {
        name = "lifecycle_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "400cb7ad9a3550e4a056bfe1a7249ab03f523820";
        hash = "sha256-FA7CdkffuOXf58i2saMPuSv0VnVWFjNN5xkHSiEvrNM=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "lifecycle_py";
  version = "0.33.5-1";
  src = sources."lifecycle_py";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ lifecycle-msgs rclpy std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common lifecycle ros-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package containing demos for rclpy lifecycle implementation";
  };
}
