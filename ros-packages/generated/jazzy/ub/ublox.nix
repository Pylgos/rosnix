{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  ublox_gps,
  ublox_msgs,
  ublox_serialization,
}:
let
  sources = mkSourceSet (sources: {
    "ublox" = substituteSource {
      src = fetchgit {
        name = "ublox-source";
        url = "https://github.com/ros2-gbp/ublox-release.git";
        rev = "4de0d3af5abd05e2823b6947261f9c0fa83e6bfa";
        hash = "sha256-tCPY6Wu0TQ0Auvkx3xW6yyreMV7K0GruiyS4AZ29LtI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ublox";
  version = "2.3.0-4";
  src = sources."ublox";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ublox_gps ublox_msgs ublox_serialization ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides a ublox_gps node for u-blox GPS receivers, messages, and serialization packages for the binary UBX protocol.";
  };
}