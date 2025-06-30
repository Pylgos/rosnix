{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dummy_map_server";
  version = "0.37.1-1";
  src = finalAttrs.passthru.sources."dummy_map_server";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ nav-msgs rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nav-msgs rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dummy_map_server" = substituteSource {
      src = fetchgit {
        name = "dummy_map_server-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "309890bc0d5fcf0fd6329f64c5ac301456ec1aff";
        hash = "sha256-m9h7TO/LE6Uss5Q5YjJaPPfgx1/8YJxt5Zncy9j5GGM=";
      };
    };
  });
  meta = {
    description = "\n    dummy map server node\n  ";
  };
})
