{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ibeo_msgs" = substituteSource {
      src = fetchgit {
        name = "ibeo_msgs-source";
        url = "https://github.com/ros2-gbp/astuff_sensor_msgs-release.git";
        rev = "7b2b41c497c5067996da1c998296fa859ebb05f2";
        hash = "sha256-RLaDU8WKC534uEb0HZcS/iP0//JhyyaFVG8osixglEY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ibeo_msgs";
  version = "4.0.0-3";
  src = sources."ibeo_msgs";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros-environment rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ibeo_msgs package";
  };
}
