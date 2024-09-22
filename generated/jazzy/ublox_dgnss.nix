{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ntrip_client_node,
  rosSystemPackages,
  substituteSource,
  ublox_dgnss_node,
  ublox_nav_sat_fix_hp_node,
  ublox_ubx_interfaces,
  ublox_ubx_msgs,
}:
let
  sources = rec {
    ublox_dgnss = substituteSource {
      src = fetchgit {
        name = "ublox_dgnss-source";
        url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
        rev = "060b0794d0fd88f9254604e252f6a729729409c7";
        hash = "sha256-6iGhNZeoJO63+6Z50d7QqpRpzqjKw+GVN0jKCKIK/Nw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ublox_dgnss";
  version = "0.5.3-2";
  src = sources.ublox_dgnss;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ntrip_client_node ublox_dgnss_node ublox_nav_sat_fix_hp_node ublox_ubx_interfaces ublox_ubx_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides a ublox_dgnss node for a u-blox GPS DGNSS receiver using Gen 9 UBX Protocol";
  };
}
