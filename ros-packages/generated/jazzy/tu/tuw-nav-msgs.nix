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
  version = "0.2.5-1";
  src = finalAttrs.passthru.sources."tuw_nav_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs nav-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_nav_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_nav_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "c81127f4f3c173b388a343c64c80743cfcf8421e";
        hash = "sha256-Xylwbg2RP2DVbuaANx2tu8F/ATU4MP3DysrvyIBOp2g=";
      };
    };
  });
  meta = {
    description = "The tuw_nav_msgs package";
  };
})
