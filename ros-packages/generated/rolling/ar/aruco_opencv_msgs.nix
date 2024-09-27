{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    aruco_opencv_msgs-447a1e7b8f67eac20c3bf6fcbf89fa8a927be379 = substituteSource {
      src = fetchgit {
        name = "aruco_opencv_msgs-447a1e7b8f67eac20c3bf6fcbf89fa8a927be379-source";
        url = "https://github.com/ros2-gbp/aruco_opencv-release.git";
        rev = "447a1e7b8f67eac20c3bf6fcbf89fa8a927be379";
        hash = "sha256-dP2eRoPV3R8Okt63Wb5WW9MsbCpOeZ/3ti0YVxYtkKU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "aruco_opencv_msgs";
  version = "6.0.1-1";
  src = sources.aruco_opencv_msgs-447a1e7b8f67eac20c3bf6fcbf89fa8a927be379;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_lint_cmake ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Message definitions for aruco_opencv package.";
  };
}
