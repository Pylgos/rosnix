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
  pname = "tuw_multi_robot_msgs";
  version = "0.2.4-1";
  src = finalAttrs.passthru.sources."tuw_multi_robot_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_multi_robot_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_multi_robot_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "9c18a899a8818c6e0c9ff7624736d0bb49e65952";
        hash = "sha256-c9/lK9XuwE8rVVv9KNsKzYvlJBjYjtO4+jJtuFyPHkU=";
      };
    };
  });
  meta = {
    description = "The tuw_multi_robot_msgs package contains messages for sending graph, route and sync data over topics.";
  };
})
