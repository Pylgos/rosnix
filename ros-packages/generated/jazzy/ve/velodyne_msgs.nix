{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "velodyne_msgs" = substituteSource {
      src = fetchgit {
        name = "velodyne_msgs-source";
        url = "https://github.com/ros2-gbp/velodyne-release.git";
        rev = "42dfd152f78b4edca4ed94c689332373b25a75b8";
        hash = "sha256-5Ak6A/tW8O/xY1B8LoKlY6GJfvga1cnajGYEKb7eKFo=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "velodyne_msgs";
  version = "2.3.0-4";
  src = sources."velodyne_msgs";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS message definitions for Velodyne 3D LIDARs.";
  };
}