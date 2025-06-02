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
  version = "0.2.6-1";
  src = finalAttrs.passthru.sources."tuw_geometry_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_geometry_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_geometry_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "469ddd2125d33a4ae0aeba5c7a4fc2ab86503a08";
        hash = "sha256-/thfIyY1Icgso4wxlXSvMceenvyquh4gb7R730R2w3k=";
      };
    };
  });
  meta = {
    description = "The tuw_geometry_msgs package";
  };
})
