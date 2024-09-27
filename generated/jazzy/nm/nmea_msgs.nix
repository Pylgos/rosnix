{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
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
    nmea_msgs-b80bfbffa9a31b97cfa2952ce66e2758c00bd0ac = substituteSource {
      src = fetchgit {
        name = "nmea_msgs-b80bfbffa9a31b97cfa2952ce66e2758c00bd0ac-source";
        url = "https://github.com/ros2-gbp/nmea_msgs-release.git";
        rev = "b80bfbffa9a31b97cfa2952ce66e2758c00bd0ac";
        hash = "sha256-bLkC+tkA0cqER/1WKKbOYYYpOp96t3ZNxVS5VgFVYOE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nmea_msgs";
  version = "2.1.0-3";
  src = sources.nmea_msgs-b80bfbffa9a31b97cfa2952ce66e2758c00bd0ac;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The nmea_msgs package contains messages related to data in the NMEA format.";
  };
}
