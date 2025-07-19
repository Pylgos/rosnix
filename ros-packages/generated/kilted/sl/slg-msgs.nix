{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
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
  pname = "slg_msgs";
  version = "3.9.1-2";
  src = finalAttrs.passthru.sources."slg_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "slg_msgs" = substituteSource {
      src = fetchgit {
        name = "slg_msgs-source";
        url = "https://github.com/ros2-gbp/slg_msgs-release.git";
        rev = "833eb11e22fa2ac5d57f6c5f8d6ba9587b68e602";
        hash = "sha256-SVK95ynCMc88weCW2f6y0xe1+5rkwZjOMHpKO+0Bk/Y=";
      };
    };
  });
  meta = {
    description = "This package provides classes and messages to interact with laser related geometry.";
  };
})
