{
  ament-cmake,
  ament-lint-auto,
  ament-lint-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "graph_msgs";
  version = "0.2.0-6";
  src = finalAttrs.passthru.sources."graph_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "graph_msgs" = substituteSource {
      src = fetchgit {
        name = "graph_msgs-source";
        url = "https://github.com/ros2-gbp/graph_msgs-release.git";
        rev = "9056b4db2fd4b4f45fe9f7f0be193f22f6739aea";
        hash = "sha256-Zs/vEflqm3Ft6PVC5rmE7JAj2pPFja8QAhBxSsH93dg=";
      };
    };
  });
  meta = {
    description = "ROS messages for publishing graphs of different data types";
  };
})
