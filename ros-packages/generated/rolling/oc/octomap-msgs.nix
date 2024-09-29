{
  ament-cmake,
  buildRosPackage,
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
    "octomap_msgs" = substituteSource {
      src = fetchgit {
        name = "octomap_msgs-source";
        url = "https://github.com/ros2-gbp/octomap_msgs-release.git";
        rev = "e7f6f4c35b2233c5591d0daee0976eb5b6957f4b";
        hash = "sha256-97tbZTVcZMc2CB2JAW6gn0/ABahvBbfiC3jpHDIJJ6I=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "octomap-msgs";
  version = "2.0.0-4";
  src = sources."octomap_msgs";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package provides messages and serializations / conversion for the";
  };
}
