{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    octomap_msgs-39bbd140c83dca8c443e3eb536ac20fbf1321d3f = substituteSource {
      src = fetchgit {
        name = "octomap_msgs-39bbd140c83dca8c443e3eb536ac20fbf1321d3f-source";
        url = "https://github.com/ros2-gbp/octomap_msgs-release.git";
        rev = "39bbd140c83dca8c443e3eb536ac20fbf1321d3f";
        hash = "sha256-97tbZTVcZMc2CB2JAW6gn0/ABahvBbfiC3jpHDIJJ6I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "octomap_msgs";
  version = "2.0.0-5";
  src = sources.octomap_msgs-39bbd140c83dca8c443e3eb536ac20fbf1321d3f;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package provides messages and serializations / conversion for the";
  };
}
