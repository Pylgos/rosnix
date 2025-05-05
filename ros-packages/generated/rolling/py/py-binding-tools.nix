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
  geometry-msgs,
  mkSourceSet,
  pybind11-vendor,
  rclcpp,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "py_binding_tools";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."py_binding_tools";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ pybind11-vendor rclcpp ];
  propagatedBuildInputs = [ geometry-msgs ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common rclpy std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "py_binding_tools" = substituteSource {
      src = fetchgit {
        name = "py_binding_tools-source";
        url = "https://github.com/ros2-gbp/py_binding_tools-release.git";
        rev = "f84c9aed3b91104b3320e1e3732df4344cd568b7";
        hash = "sha256-ptJcdfTt1QQXFPCJ4R1QqIIcwEOHo+ay+T7OJqwDAYo=";
      };
    };
  });
  meta = {
    description = "Python binding tools for C++";
  };
})
