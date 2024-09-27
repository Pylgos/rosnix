{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    novatel_gps_msgs-a08f1e0185cf6dc0ea3baf9b6763aed500a7290c = substituteSource {
      src = fetchgit {
        name = "novatel_gps_msgs-a08f1e0185cf6dc0ea3baf9b6763aed500a7290c-source";
        url = "https://github.com/ros2-gbp/novatel_gps_driver-release.git";
        rev = "a08f1e0185cf6dc0ea3baf9b6763aed500a7290c";
        hash = "sha256-kjJ9vONE54WT4ZTXe3G+F0WieULuO/6mgMO3dAFCZGc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "novatel_gps_msgs";
  version = "4.1.2-1";
  src = sources.novatel_gps_msgs-a08f1e0185cf6dc0ea3baf9b6763aed500a7290c;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Messages for proprietary (non-NMEA) sentences from Novatel GPS receivers.";
  };
}
