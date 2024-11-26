{
  ament-cmake,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-gui,
  rclpy,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rqt_py_common";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."rqt_py_common";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedBuildInputs = [ python-qt-binding qt-gui rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common rosidl-default-generators rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_py_common" = substituteSource {
      src = fetchgit {
        name = "rqt_py_common-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "b7a39318b177c05201676800b41085d3d120a177";
        hash = "sha256-qRqDzXsT06HyvaSFlLOWINupnQKitro29dDYk9Aja1g=";
      };
    };
  });
  meta = {
    description = "rqt_py_common provides common functionality for rqt plugins written in Python. Despite no plugin is provided, this package is part of the rqt_common_plugins repository to keep refactoring generic functionality from these common plugins into this package as easy as possible. Functionality included in this package should cover generic ROS concepts and should not introduce any special dependencies beside \"ros_base\".";
  };
})
