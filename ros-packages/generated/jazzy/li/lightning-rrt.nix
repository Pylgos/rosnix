{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lightning-rrt-interfaces,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  ros2launch,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lightning_rrt";
  version = "0.0.1-1";
  src = finalAttrs.passthru.sources."lightning_rrt";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs lightning-rrt-interfaces nav-msgs rclcpp ros2launch std-msgs visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs lightning-rrt-interfaces nav-msgs rclcpp ros2launch std-msgs visualization-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "lightning_rrt" = substituteSource {
      src = fetchgit {
        name = "lightning_rrt-source";
        url = "https://github.com/david-dorf/lightning_rrt.git";
        rev = "f0c405c46fd9b70aac1cce01cd820f714f5c82f1";
        hash = "sha256-eZOK3lx0vOF7JM78hTPKbkJkzY2r4C8wusvhJ+S/HNg=";
      };
    };
  });
  meta = {
    description = "Lightning fast RRT path planner";
  };
})
