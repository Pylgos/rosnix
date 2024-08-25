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
        rev = "b00f912bffbfc4bcd5a5b4c0981cc987449719f3";
        hash = "sha256-O7uegvVK9JP7juWtlT41devO/YkgnTe3FUb0VYtDDZg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_opencv_util";
  version = "3.6.1-2";
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
    description = "swri_opencv_util";
  };
}
