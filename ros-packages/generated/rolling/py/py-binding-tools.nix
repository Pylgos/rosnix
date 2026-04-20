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
  rclcpp,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "py_binding_tools";
  version = "2.1.2-2";
  src = finalAttrs.passthru.sources."py_binding_tools";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ geometry-msgs rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pybind11-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ geometry-msgs rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pybind11-dev" ]; };
  checkInputs = [ ament-cmake-pytest rclpy std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "py_binding_tools" = substituteSource {
      src = fetchgit {
        name = "py_binding_tools-source";
        url = "https://github.com/ros2-gbp/py_binding_tools-release.git";
        rev = "7a0f7a3509d788cc35a479154f9e3a400faf8faf";
        hash = "sha256-wNec5NzR6LGcCfuizXNEzkv7Af2wRxkH8dTs+m1vGCY=";
      };
    };
  });
  meta = {
    description = "Python binding tools for C++";
  };
})
