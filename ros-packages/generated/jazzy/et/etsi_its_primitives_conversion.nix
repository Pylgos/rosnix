{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "etsi_its_primitives_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_primitives_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "c008d065b1f3de74466665d29a45950623d5dcf9";
        hash = "sha256-6ym/VNlaFLfr6vT8pV8GzWXX0Me9eQSY4OraLW6DMJ0=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "etsi_its_primitives_conversion";
  version = "2.2.0-1";
  src = sources."etsi_its_primitives_conversion";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Conversion functions for converting ROS primitives to and from ASN.1-encoded primitives";
  };
}