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
  pname = "tuw_geometry_msgs";
  version = "0.2.5-1";
  src = finalAttrs.passthru.sources."tuw_geometry_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_geometry_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_geometry_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "977237a5c67e181d92628068667b553bfced7d71";
        hash = "sha256-eKKGTOm2YzFe2aOXmqWWxexiICRQvS/RYwpDbydQoc0=";
      };
    };
  });
  meta = {
    description = "The tuw_geometry_msgs package";
  };
})
