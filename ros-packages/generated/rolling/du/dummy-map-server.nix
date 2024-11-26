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
  version = "0.35.1-1";
  src = finalAttrs.passthru.sources."dummy_map_server";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nav-msgs rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dummy_map_server" = substituteSource {
      src = fetchgit {
        name = "dummy_map_server-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "44d3d3e365caa8b206f4389849af933a0354dacf";
        hash = "sha256-QbX7oY60WHbuX3T+eofbqMPhtV6dHH8Qxx0c2Uc0uS4=";
      };
    };
  });
  meta = {
    description = "dummy map server node";
  };
})
