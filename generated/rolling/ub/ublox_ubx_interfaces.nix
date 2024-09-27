{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  substituteSource,
}:
let
  sources = rec {
    ublox_ubx_interfaces-e27d90efec07126bf1a61a720c6154848d0d5b5c = substituteSource {
      src = fetchgit {
        name = "ublox_ubx_interfaces-e27d90efec07126bf1a61a720c6154848d0d5b5c-source";
        url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
        rev = "e27d90efec07126bf1a61a720c6154848d0d5b5c";
        hash = "sha256-GKe0RGAVTzo1s9aVoDdarKkspqxDfGs9JB6jM3JmrBo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ublox_ubx_interfaces";
  version = "0.5.3-1";
  src = sources.ublox_ubx_interfaces-e27d90efec07126bf1a61a720c6154848d0d5b5c;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "UBLOX UBX Interfaces";
  };
}
