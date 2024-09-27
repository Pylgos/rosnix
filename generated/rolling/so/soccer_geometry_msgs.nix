{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    soccer_geometry_msgs-848a1816c6aaadc8166b37b0eb0a95165d84c1ae = substituteSource {
      src = fetchgit {
        name = "soccer_geometry_msgs-848a1816c6aaadc8166b37b0eb0a95165d84c1ae-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "848a1816c6aaadc8166b37b0eb0a95165d84c1ae";
        hash = "sha256-gMowKNUK3HPz9hWgGtJ8VWq8btZTIYly2Ydi23VUsdA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_geometry_msgs";
  version = "1.0.0-1";
  src = sources.soccer_geometry_msgs-848a1816c6aaadc8166b37b0eb0a95165d84c1ae;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing msgs that extend geometry_msgs for use in soccer-related packages";
  };
}
