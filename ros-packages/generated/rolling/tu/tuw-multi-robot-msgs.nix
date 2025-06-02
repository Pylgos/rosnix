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
  pname = "tuw_multi_robot_msgs";
  version = "0.2.6-1";
  src = finalAttrs.passthru.sources."tuw_multi_robot_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_multi_robot_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_multi_robot_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "89a41d6115f02db9a3b17f1a6a07e222d2e85fb7";
        hash = "sha256-7g/hZnLIPDUBH5HlJ4SfLRZyxheW7hh+pkWnE7x9Zi4=";
      };
    };
  });
  meta = {
    description = "The tuw_multi_robot_msgs package contains messages for sending graph, route and sync data over topics.";
  };
})
