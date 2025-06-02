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
  nav-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tuw_nav_msgs";
  version = "0.2.6-1";
  src = finalAttrs.passthru.sources."tuw_nav_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs nav-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs nav-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_nav_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_nav_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "6fc29942ce725d5024c702179cba40485de13cad";
        hash = "sha256-6HELjbtax3nkY/1YSiTemMd4Hr0znICzfgoWkgyVeEw=";
      };
    };
  });
  meta = {
    description = "The tuw_nav_msgs package";
  };
})
