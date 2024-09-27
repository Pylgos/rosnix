{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  grid_map_cmake_helpers,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rosidl_default_generators,
  std_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "grid_map_msgs" = substituteSource {
      src = fetchgit {
        name = "grid_map_msgs-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "478b56d5d15f3b27dc7cb9f8bb1101d66bcb9d8d";
        hash = "sha256-ES/jTKiB2zn6XveDTR7Y7+a1gtK8O+yQUMsbontFaqo=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "grid_map_msgs";
  version = "2.2.0-1";
  src = sources."grid_map_msgs";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs grid_map_cmake_helpers rclcpp std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Definition of the multi-layered grid map message type.";
  };
}
