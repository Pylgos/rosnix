{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  grid-map-cmake-helpers,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rosidl-default-generators,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grid_map_msgs";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."grid_map_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs grid-map-cmake-helpers rclcpp rosidl-default-generators std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs grid-map-cmake-helpers rclcpp rosidl-default-generators std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_msgs" = substituteSource {
      src = fetchgit {
        name = "grid_map_msgs-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "cc10df26dc084af869272ae4a3a05823c23c21d8";
        hash = "sha256-Wxzb7Z32XIaQGWdsl/Xs72oK7DGndaL1UnpR6WwSGXw=";
      };
    };
  });
  meta = {
    description = "Definition of the multi-layered grid map message type.";
  };
})
