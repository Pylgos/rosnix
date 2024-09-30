{
  action-msgs,
  ament-cmake,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "kobuki_ros_interfaces" = substituteSource {
      src = fetchgit {
        name = "kobuki_ros_interfaces-source";
        url = "https://github.com/ros2-gbp/kobuki_ros_interfaces-release.git";
        rev = "9820a7d8eccd0f20c0fe747a6140d60bd782419a";
        hash = "sha256-svbQG6e1o4u1HncdcNcx55XoYK99I02G7CxL2jvBZhs=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "kobuki_ros_interfaces";
  version = "1.0.0-4";
  src = sources."kobuki_ros_interfaces";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action-msgs rosidl-default-runtime std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "";
  };
}
