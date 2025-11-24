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
  version = "0.33.8-1";
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
        rev = "533b864ae5ad574c6f41b05d1dcb88f090283236";
        hash = "sha256-XUXb0syPgK71QoXLzc0Rq25WGw2R1FQbnWXdOI/2t3w=";
      };
    };
  });
  meta = {
    description = "\n    dummy map server node\n  ";
  };
})
