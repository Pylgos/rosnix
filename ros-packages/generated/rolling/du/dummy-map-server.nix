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
  version = "0.37.8-2";
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
        rev = "07c6d76644e56a42c0eca1e769cf20add376ed84";
        hash = "sha256-wPAc80z07SF7P8/tFHt6Ixfhz/hy0Gxlf2YwxTYulQk=";
      };
    };
  });
  meta = {
    description = "\n    dummy map server node\n  ";
  };
})
