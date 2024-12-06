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
  version = "0.2.2-2";
  src = finalAttrs.passthru.sources."tuw_multi_robot_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_multi_robot_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_multi_robot_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "e37a208586a7ef28fdb71f2d93c035a4d2822a51";
        hash = "sha256-Xxr5KmCuHxPlzrnLZgWWUkXUoBA0h5cEYjP70idx0d0=";
      };
    };
  });
  meta = {
    description = "The tuw_multi_robot_msgs package contains messages for sending graph, route and sync data over topics.";
  };
})
