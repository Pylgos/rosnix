{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    ros_image_to_qimage-73eb2db321f27aab67b475a236a19607124896be = substituteSource {
      src = fetchgit {
        name = "ros_image_to_qimage-73eb2db321f27aab67b475a236a19607124896be-source";
        url = "https://github.com/ros2-gbp/ros_image_to_qimage-release.git";
        rev = "73eb2db321f27aab67b475a236a19607124896be";
        hash = "sha256-qxt94vxyKVhWR64DyvjU5D5xKcJcflZdDd/jA2e0d9U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_image_to_qimage";
  version = "0.4.1-4";
  src = sources.ros_image_to_qimage-73eb2db321f27aab67b475a236a19607124896be;
  nativeBuildInputs = [ ament_cmake ament_cmake_pytest ament_cmake_python wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge python_qt_binding sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package that converts a ros image msg to a qimage object";
  };
}
