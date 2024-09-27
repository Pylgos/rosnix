{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    swri_serial_util-0681dbfa1872233b1ee9bd8b25bcb14f9d471056 = substituteSource {
      src = fetchgit {
        name = "swri_serial_util-0681dbfa1872233b1ee9bd8b25bcb14f9d471056-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "0681dbfa1872233b1ee9bd8b25bcb14f9d471056";
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
  src = sources.swri_serial_util-0681dbfa1872233b1ee9bd8b25bcb14f9d471056;
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
