{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
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
  pname = "tuw_graph_msgs";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."tuw_graph_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_graph_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_graph_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "bb085ce618608f9ba3e35e46ff15213e2f00c7e1";
        hash = "sha256-15VogEmCwzKMtwXxzYmItO8da+gqJMPYfkL1dqKl20U=";
      };
    };
  });
  meta = {
    description = "The tuw_graph_msgs package contains messages for sending graphs.";
  };
})
