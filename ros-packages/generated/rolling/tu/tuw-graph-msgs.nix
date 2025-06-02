{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-gtest,
  ament-lint-auto,
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
  version = "0.2.6-1";
  src = finalAttrs.passthru.sources."tuw_graph_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_graph_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_graph_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "5fab869abb808c0cdb36eaf7f46d1ccfac1f77c8";
        hash = "sha256-0mDvS0mdmArteQlqjPvdmy/Vk37jXabSleJEhEbMX6U=";
      };
    };
  });
  meta = {
    description = "The tuw_graph_msgs package contains messages for sending graphs.";
  };
})
