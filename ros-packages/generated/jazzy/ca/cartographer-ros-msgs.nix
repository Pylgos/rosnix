{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "cartographer_ros_msgs" = substituteSource {
      src = fetchgit {
        name = "cartographer_ros_msgs-source";
        url = "https://github.com/ros2-gbp/cartographer_ros-release.git";
        rev = "9a63c21a390bff45650200ccf82af75957ba8dec";
        hash = "sha256-POmR42dN/mrsnISU7egd4dQ/y+W+VWvPUwQK+JlLCeU=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "cartographer-ros-msgs";
  version = "2.0.9003-2";
  src = sources."cartographer_ros_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS messages for the cartographer_ros package.";
  };
}