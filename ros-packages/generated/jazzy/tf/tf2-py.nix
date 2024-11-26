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
  version = "0.36.5-1";
  src = finalAttrs.passthru.sources."tf2_py";
  nativeBuildInputs = [ ament-cmake python-cmake-module ];
  propagatedNativeBuildInputs = [ rpyutils ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclpy tf2 ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "tf2_py" = substituteSource {
        src = fetchgit {
          name = "tf2_py-source";
          url = "https://github.com/ros2-gbp/geometry2-release.git";
          rev = "a0fc5a276ee0fa1b51e20c955d9442c21ff79410";
          hash = "sha256-F7Md1zRqgcYly3sNg79/yyB4VqSO09O6DLUu9qE8VHY=";
        };
      };
    });
  };
  meta = {
    description = "The tf2_py package";
  };
})
