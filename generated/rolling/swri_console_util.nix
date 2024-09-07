{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    swri_console_util = substituteSource {
      src = fetchgit {
        name = "swri_console_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "f441db1f2cd5e63c850761f521bf7a2d92ce80a8";
        hash = "sha256-KEz8hLJvUuPd4qB44RQGaWcMz7FIzCuD5XA4hTVerqQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_console_util";
  version = "3.7.1-1";
  src = sources.swri_console_util;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Utility functions for interacting with console";
  };
}
