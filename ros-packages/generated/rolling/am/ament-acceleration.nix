{
  ament-cmake-core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ament_acceleration" = substituteSource {
      src = fetchgit {
        name = "ament_acceleration-source";
        url = "https://github.com/ros2-gbp/ament_acceleration-release.git";
        rev = "9ac46c6be6e298bd01581abe8d82371e0944d12a";
        hash = "sha256-tnkilfsTlrhC8xcFlu9E8VIt8hGsNKCcdD53KV8JRac=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ament_acceleration";
  version = "0.2.0-4";
  src = sources."ament_acceleration";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "CMake macros and utilities to include hardware acceleration into the ROS 2 build system (ament) and its development flows.";
  };
}
