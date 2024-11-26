{
  ament-cmake,
  ament-cmake-pytest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-cmake-module,
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
  version = "1.6.0-2";
  src = finalAttrs.passthru.sources."rqt_py_common";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ python-qt-binding qt-gui rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-pytest python-cmake-module rosidl-default-generators rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_py_common" = substituteSource {
      src = fetchgit {
        name = "rqt_py_common-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "80e2f847182d27477df1159a9022413c4fcfd186";
        hash = "sha256-H/iAtFmK7PVUTchMY43rrjinZ8FP5i2yivXA4MCdqZQ=";
      };
    };
  });
  meta = {
    description = "rqt_py_common provides common functionality for rqt plugins written in Python. Despite no plugin is provided, this package is part of the rqt_common_plugins repository to keep refactoring generic functionality from these common plugins into this package as easy as possible. Functionality included in this package should cover generic ROS concepts and should not introduce any special dependencies beside \"ros_base\".";
  };
})
