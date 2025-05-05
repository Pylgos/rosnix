{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
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
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "geographic_msgs";
  version = "1.0.6-1";
  src = finalAttrs.passthru.sources."geographic_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs unique-identifier-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs unique-identifier-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-gtest ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "geographic_msgs" = substituteSource {
      src = fetchgit {
        name = "geographic_msgs-source";
        url = "https://github.com/ros2-gbp/geographic_info-release.git";
        rev = "1efe3b2b34b48437bc1af05abe67bbbf832c9957";
        hash = "sha256-nhS4kFuDj1V2F56pjP2GmIYfCB+bVsr1RI3DzbZVfsI=";
      };
    };
  });
  meta = {
    description = "\n     ROS messages for Geographic Information Systems.\n  ";
  };
})
