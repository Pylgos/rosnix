{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  domain_coordinator,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_ros = substituteSource {
      src = fetchgit {
        name = "ament_cmake_ros-source";
        url = "https://github.com/ros2-gbp/ament_cmake_ros-release.git";
        rev = "1ac05399242d607efd82eb3da758f0fd287c91cd";
        hash = "sha256-LeQRxnqBMxH1+MDIdwUSusFYJHbgHFDSlDpkThEHKdg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_ros";
  version = "0.13.0-1";
  src = sources.ament_cmake_ros;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest ament_cmake_pytest domain_coordinator ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest ament_cmake_pytest domain_coordinator ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "The ROS specific CMake bits in the ament buildsystem.";
  };
}
