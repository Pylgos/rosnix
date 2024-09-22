{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    swri_serial_util = substituteSource {
      src = fetchFromGitHub {
        name = "swri_serial_util-source";
        owner = "ros2-gbp";
        repo = "marti_common-release";
        rev = "59d5646ed755e43207b6119a84ade33efc78c083";
        hash = "sha256-fdAVUHVW5fr7Jpea4eONbvZcz+z9UbBwr9X0w0Un2LA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_serial_util";
  version = "3.7.3-1";
  src = sources.swri_serial_util;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Contains nodes and utilities for serial communication in ROS.";
  };
}
