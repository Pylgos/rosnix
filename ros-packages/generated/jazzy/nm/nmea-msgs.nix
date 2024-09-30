{
  ament-cmake,
  buildRosPackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "nmea_msgs" = substituteSource {
      src = fetchgit {
        name = "nmea_msgs-source";
        url = "https://github.com/ros2-gbp/nmea_msgs-release.git";
        rev = "b80bfbffa9a31b97cfa2952ce66e2758c00bd0ac";
        hash = "sha256-bLkC+tkA0cqER/1WKKbOYYYpOp96t3ZNxVS5VgFVYOE=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "nmea_msgs";
  version = "2.1.0-3";
  src = sources."nmea_msgs";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The nmea_msgs package contains messages related to data in the NMEA format.";
  };
}
