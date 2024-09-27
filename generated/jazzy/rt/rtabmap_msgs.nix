{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    rtabmap_msgs-4d39aa5b5a1f290d1cb15cf5bcb5807d3d46afaf = substituteSource {
      src = fetchgit {
        name = "rtabmap_msgs-4d39aa5b5a1f290d1cb15cf5bcb5807d3d46afaf-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "4d39aa5b5a1f290d1cb15cf5bcb5807d3d46afaf";
        hash = "sha256-7rObv5E6b5U7ZbUP+lk1aN9ZgzKeUiOstReb9/Fsh1E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap_msgs";
  version = "0.21.5-3";
  src = sources.rtabmap_msgs-4d39aa5b5a1f290d1cb15cf5bcb5807d3d46afaf;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime sensor_msgs std_msgs std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RTAB-Map's msgs package.";
  };
}
