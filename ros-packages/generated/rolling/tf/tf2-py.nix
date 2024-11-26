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
  rclpy,
  rosSystemPackages,
  rpyutils,
  substituteSource,
  tf2,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_py";
  version = "0.39.3-1";
  src = finalAttrs.passthru.sources."tf2_py";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclpy rpyutils tf2 ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "tf2_py" = substituteSource {
        src = fetchgit {
          name = "tf2_py-source";
          url = "https://github.com/ros2-gbp/geometry2-release.git";
          rev = "2c830f3877ecf14bc3a339bcdb53f38cc2a1324c";
          hash = "sha256-JRAABWpzhyh5BCywFNxYkDLsTv/iN+mHCWL1yuaVtXY=";
        };
      };
    });
  };
  meta = {
    description = "The tf2_py package";
  };
})
