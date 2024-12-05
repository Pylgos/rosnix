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
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."tuw_multi_robot_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_multi_robot_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_multi_robot_msgs-source";
        url = "https://github.com/tuw-robotics/tuw_msgs-release.git";
        rev = "5c5e5f0e6d86f6104c4c3e4745a6eef9cc8ae9ac";
        hash = "sha256-Xxr5KmCuHxPlzrnLZgWWUkXUoBA0h5cEYjP70idx0d0=";
      };
    };
  });
  meta = {
    description = "The tuw_multi_robot_msgs package contains messages for sending graph, route and sync data over topics.";
  };
})
