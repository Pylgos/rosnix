{
  ament-cmake,
  automotive-navigation-msgs,
  automotive-platform-msgs,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "automotive_autonomy_msgs" = substituteSource {
      src = fetchgit {
        name = "automotive_autonomy_msgs-source";
        url = "https://github.com/ros2-gbp/automotive_autonomy_msgs-release.git";
        rev = "34fc7813acfef2ff1efba213b734f4fb35656208";
        hash = "sha256-R/GduU+VD3B9INpzOpa84Bl42xFAtGthn8PEt8iYmpw=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "automotive_autonomy_msgs";
  version = "3.0.4-6";
  src = sources."automotive_autonomy_msgs";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ automotive-navigation-msgs automotive-platform-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Messages for vehicle automation";
  };
}
