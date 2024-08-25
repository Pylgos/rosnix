{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    swri_serial_util = substituteSource {
      src = fetchgit {
        name = "swri_serial_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "bbac0dfc7c9cb57508e663a6c0c6d59ff2b39e15";
        hash = "sha256-MtfpNlZ7vE6gIf3Fg5rtl/4sDegKFpKiyBrIFCwXJy8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_serial_util";
  version = "3.6.1-3";
  src = sources.swri_serial_util;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "swri_serial_util";
  };
}
