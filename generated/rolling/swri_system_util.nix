{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    swri_system_util = substituteSource {
      src = fetchgit {
        name = "swri_system_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "6f0fd3a3e913d09d70e34147ee2ee22753ff32fe";
        hash = "sha256-lztv/nbapk8Bx4IpEnA6byf/6/+KlrNFa+g+otVon1c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_system_util";
  version = "3.7.1-1";
  src = sources.swri_system_util;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.boost rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_index_cpp ];
  missingDependencies = [  ];
  meta = {
    description = "A package with commonly used system utilities.";
  };
}
