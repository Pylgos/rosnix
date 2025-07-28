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
  version = "0.43.1-1";
  src = finalAttrs.passthru.sources."tf2_py";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rclpy rpyutils tf2 ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclpy rpyutils tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-dev" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_py" = substituteSource {
      src = fetchgit {
        name = "tf2_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "998d6e0eb55709e45b27994716cdd5aff126a5b0";
        hash = "sha256-KjDGcmHFowdcoT4wJAto3o1JC4UdXndA2ZErdetzHmI=";
      };
    };
  });
  meta = {
    description = "The tf2_py package";
  };
})
