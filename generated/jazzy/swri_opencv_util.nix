{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
  swri_math_util,
}:
let
  sources = rec {
    swri_opencv_util = substituteSource {
      src = fetchgit {
        name = "swri_opencv_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "da4b37de2beb5b4e14a1e79fdf1322f648768f4d";
        hash = "sha256-OLQm/HqAqXdLtEA5qdaFwH+UyF0KqZ2qGtgmLUnUWFE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_opencv_util";
  version = "3.7.1-1";
  src = sources.swri_opencv_util;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge python3Packages.boost swri_math_util ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "A package with commonly used OpenCV functionality.";
  };
}
