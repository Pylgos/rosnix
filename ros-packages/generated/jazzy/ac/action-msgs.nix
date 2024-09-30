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
  rosSystemPackages,
  rosidl-core-generators,
  rosidl-core-runtime,
  service-msgs,
  substituteSource,
  unique-identifier-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "action_msgs" = substituteSource {
      src = fetchgit {
        name = "action_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "6e0b31e86079a661e1aa4a13cab22c4c5c6a0c73";
        hash = "sha256-0XYc90JzsBo5Kqbj1YJl3q/1gyUYZI1G/kewVb/PPWs=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "action_msgs";
  version = "2.0.2-2";
  src = sources."action_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-core-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces rosidl-core-runtime service-msgs unique-identifier-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Messages and service definitions common among all ROS actions.";
  };
}
