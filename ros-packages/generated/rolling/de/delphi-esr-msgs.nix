{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "delphi_esr_msgs" = substituteSource {
      src = fetchgit {
        name = "delphi_esr_msgs-source";
        url = "https://github.com/ros2-gbp/astuff_sensor_msgs-release.git";
        rev = "96b9241b12511f5374df1fc6997f3f5cb9803bd4";
        hash = "sha256-K7D4wHGenbiq35o06s88bjoKOUdZl3oqIoSabiYN24o=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "delphi_esr_msgs";
  version = "4.0.0-3";
  src = sources."delphi_esr_msgs";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros-environment rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Message definitions for the Delphi ESR";
  };
}
