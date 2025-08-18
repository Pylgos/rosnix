{
  ament-cmake,
  ament-cmake-pytest,
  ament-cmake-python,
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
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."py_binding_tools";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ geometry-msgs pybind11-vendor rclcpp ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ geometry-msgs pybind11-vendor rclcpp ];
  checkInputs = [ ament-cmake-pytest rclpy std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "py_binding_tools" = substituteSource {
      src = fetchgit {
        name = "py_binding_tools-source";
        url = "https://github.com/ros2-gbp/py_binding_tools-release.git";
        rev = "58e5361922500c5277f7c0454e96b1f7e4548def";
        hash = "sha256-PCcIDNeTQifGtpoaFZIRysovfTYNUiBRyLDgkWvF+M4=";
      };
    };
  });
  meta = {
    description = "Python binding tools for C++";
  };
})
