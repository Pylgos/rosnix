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
  version = "0.37.3-1";
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
        rev = "7b5b95019f5c50fff739d885aa69bd71c836fc41";
        hash = "sha256-as8lVrc7gg1If+p9G4EMuuboEwggwSbTTSxCyLYakbA=";
      };
    };
  });
  meta = {
    description = "\n    dummy map server node\n  ";
  };
})
