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
    marine_acoustic_msgs-38d4fc11273b589bf376bb015127ddac160964e7 = substituteSource {
      src = fetchgit {
        name = "marine_acoustic_msgs-38d4fc11273b589bf376bb015127ddac160964e7-source";
        url = "https://github.com/ros2-gbp/marine_msgs-release.git";
        rev = "38d4fc11273b589bf376bb015127ddac160964e7";
        hash = "sha256-ALbjKiPGNTichMtqbwwJIA4Y52MYdCELmDl3tLU3dC4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marine_acoustic_msgs";
  version = "2.1.0-1";
  src = sources.marine_acoustic_msgs-38d4fc11273b589bf376bb015127ddac160964e7;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The marine_acoustic_msgs package, including messages for common underwater sensors (DVL, multibeam sonar, imaging sonar)";
  };
}
