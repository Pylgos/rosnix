{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cx_msgs";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."cx_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cx_msgs" = substituteSource {
      src = fetchgit {
        name = "cx_msgs-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "5f7ec764937601ba73a943d79dde528043c56eb2";
        hash = "sha256-sztnl7E+1qWMgw7DII3ZmsreR3nIsK+iCmuNWmDvftM=";
      };
    };
  });
  meta = {
    description = "ROS interfaces for ROS2 CLIPS-Executive";
  };
})
