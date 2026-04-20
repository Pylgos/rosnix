{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  bond,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  smclib,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "bondcpp";
  version = "4.3.0-1";
  src = finalAttrs.passthru.sources."bondcpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ bond rclcpp rclcpp-lifecycle smclib ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" "uuid" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ bond rclcpp rclcpp-lifecycle smclib ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" "uuid" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "bondcpp" = substituteSource {
      src = fetchgit {
        name = "bondcpp-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "a3eec8ba1d4b25b33dcc0a832fc9b966d2305206";
        hash = "sha256-H01mo91vxVoRTVyrSEOxMKUZosKX1+kYNWU1PK0P9+8=";
      };
    };
  });
  meta = {
    description = "\n    C++ implementation of bond, a mechanism for checking when\n    another process has terminated.\n  ";
  };
})
