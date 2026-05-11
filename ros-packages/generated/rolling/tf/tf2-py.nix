{
  ament-cmake,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  rpyutils,
  substituteSource,
  tf2,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_py";
  version = "0.46.0-1";
  src = finalAttrs.passthru.sources."tf2_py";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rclpy rpyutils tf2 ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclpy rpyutils tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-dev" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_py" = substituteSource {
      src = fetchgit {
        name = "tf2_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "5ae37e456a7d4410781b719e54ecd70046c2eba6";
        hash = "sha256-QB5qnXoaZb+jwaN8UiyllegTiqNE7z/BxZdkx3amyuw=";
      };
    };
  });
  meta = {
    description = "Python bindings for the tf2 library";
  };
})
