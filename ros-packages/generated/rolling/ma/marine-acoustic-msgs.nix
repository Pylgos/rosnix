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
    "marine_acoustic_msgs" = substituteSource {
      src = fetchgit {
        name = "marine_acoustic_msgs-source";
        url = "https://github.com/ros2-gbp/marine_msgs-release.git";
        rev = "38d4fc11273b589bf376bb015127ddac160964e7";
        hash = "sha256-ALbjKiPGNTichMtqbwwJIA4Y52MYdCELmDl3tLU3dC4=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "marine_acoustic_msgs";
  version = "2.1.0-1";
  src = sources."marine_acoustic_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The marine_acoustic_msgs package, including messages for common underwater sensors (DVL, multibeam sonar, imaging sonar)";
  };
}
