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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rqt_py_common";
  version = "1.10.4-1";
  src = finalAttrs.passthru.sources."rqt_py_common";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ python-qt-binding qt-gui rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qt-base-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ python-qt-binding qt-gui rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qt-base-dev" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common rosidl-default-generators rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_py_common" = substituteSource {
      src = fetchgit {
        name = "rqt_py_common-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "86188f7b44558dad29be9ce9896681883e2a9146";
        hash = "sha256-qqMjFoIScJJKnFF9Eau97ljaqtfrJWhGW4Ei8aCrKZE=";
      };
    };
  });
  meta = {
    description = "\n    rqt_py_common provides common functionality for rqt plugins written in Python.\n    Despite no plugin is provided, this package is part of the rqt_common_plugins\n    repository to keep refactoring generic functionality from these common plugins\n    into this package as easy as possible.\n\n    Functionality included in this package should cover generic ROS concepts and\n    should not introduce any special dependencies beside \"ros_base\".\n  ";
  };
})
