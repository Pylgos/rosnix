{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  camera_calibration_parsers,
  camera_info_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  substituteSource,
}:
let
  sources = rec {
    image_common = substituteSource {
      src = fetchgit {
        name = "image_common-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "737ceda740fe52fa79afaf8a811baa920bb26b89";
        hash = "sha256-m769Wq7qhVC/KiCtOC9vt+5MAIDP45myrL8oz+oCF/E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_common";
  version = "5.3.2-1";
  src = sources.image_common;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_calibration_parsers camera_info_manager image_transport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Common code for working with images in ROS.";
  };
}
