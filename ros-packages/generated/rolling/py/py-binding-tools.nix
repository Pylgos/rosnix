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
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."py_binding_tools";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ geometry-msgs pybind11-vendor rclcpp ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ geometry-msgs pybind11-vendor rclcpp ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common rclpy std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "py_binding_tools" = substituteSource {
      src = fetchgit {
        name = "py_binding_tools-source";
        url = "https://github.com/ros2-gbp/py_binding_tools-release.git";
        rev = "22e3a409f4a14da04fe9c401c778b67efe816963";
        hash = "sha256-LdB33ryGYNSHrUzEiDPKnL91wepwBTI0dmM65850588=";
      };
    };
  });
  meta = {
    description = "Python binding tools for C++";
  };
})
