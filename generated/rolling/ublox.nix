{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
  ublox_gps,
  ublox_msgs,
  ublox_serialization,
}:
let
  sources = rec {
    ublox = substituteSource {
      src = fetchFromGitHub {
        name = "ublox-source";
        owner = "ros2-gbp";
        repo = "ublox-release";
        rev = "2d85ed646da6998974f76b2e2dbd086401b46e61";
        hash = "sha256-tCPY6Wu0TQ0Auvkx3xW6yyreMV7K0GruiyS4AZ29LtI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ublox";
  version = "2.3.0-3";
  src = sources.ublox;
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
