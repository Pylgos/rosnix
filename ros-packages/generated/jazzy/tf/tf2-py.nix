{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  python-cmake-module,
  rclpy,
  rosSystemPackages,
  rpyutils,
  substituteSource,
  tf2,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_py";
  version = "0.36.13-1";
  src = finalAttrs.passthru.sources."tf2_py";
  nativeBuildInputs = [ ament-cmake python-cmake-module ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rclpy rpyutils tf2 ];
  buildInputs = [ ament-cmake python-cmake-module ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclpy rpyutils tf2 ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_py" = substituteSource {
      src = fetchgit {
        name = "tf2_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "15ebac5da8fdf82cd7ec18d3278839329de5d577";
        hash = "sha256-eXFyo+jl5fwmLT3XTz/Ixkz4bq6RYdYYurzAWZfRrJs=";
      };
    };
  });
  meta = {
    description = "The tf2_py package";
  };
})
