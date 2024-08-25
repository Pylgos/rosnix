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
        rev = "d59982026e607f7de8bd8736efbd62d59bb72ebf";
        hash = "sha256-MtfpNlZ7vE6gIf3Fg5rtl/4sDegKFpKiyBrIFCwXJy8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_serial_util";
  version = "3.6.1-2";
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
